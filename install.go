package main

import (
	"bufio"
	"errors"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"
)

var (
	target string
	source string
	ignore string
	allyes bool
)

func must(e error) {
	if e != nil {
		log.Fatal(e)
	}
}

func init() {
	cwd, err := os.Getwd()
	must(err)

	flag.StringVar(&target, "target", os.Getenv("HOME"), "target directory to install dotfiles")
	flag.StringVar(&source, "source", cwd, "source directory get dotfiles from")
	flag.StringVar(&ignore, "ignore", "", "comma separated list of files to ignore")
	flag.BoolVar(&allyes, "yes", false, "replace all files without prompt")
}

func exists(dir string, path string) bool {
	_, err := os.Stat(filepath.Join(dir, path))
	return !errors.Is(err, os.ErrNotExist)
}

func process(ignores []string, path string) error {
	if strings.HasPrefix(path, ".") {
		for _, ignore := range ignores {
			if ignore == path {
				return nil
			}
		}

		if exists(target, path) && !allyes {
			fmt.Printf("File %s/%s exists, replace? (Y/n) ", target, path)
			reader := bufio.NewReader(os.Stdin)
			answer, _ := reader.ReadString('\n')
			if strings.Trim(answer, " \r\n") == "n" {
				fmt.Printf("Skipping %s\n", path)
				return nil
			}

		}

		fmt.Printf("Installing %s\n", path)
		tg := filepath.Join(target, path)
		sc := filepath.Join(source, path)
		must(os.RemoveAll(tg))
		must(os.Symlink(sc, tg))
	}

	return nil
}

func main() {
	flag.Parse()

	ignores := strings.Split(ignore, ",")
	ignores = append(ignores, ".git")

	files, err := ioutil.ReadDir(source)
	must(err)

	for _, f := range files {
		err = process(ignores, f.Name())
		must(err)
	}
}

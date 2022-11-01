import sys
import os.path
import pathlib
import subprocess
from os import listdir
from os.path import isfile, join

ignores = [".git", ".config", ".", ".."]
yes_all = False
no_all = False


def info(l: str):
    print(l)


def confirm(path: str):
    global yes_all
    global no_all

    print(f"Path {path} exists, overwrite? (A/y/n/N)")
    for line in sys.stdin:
        answer = line.strip()

        if answer == "A":
            print("YES to ALL")
            yes_all = True

        if answer == "N":
            print("NO to ALL")
            no_all = True

        return not no_all and (yes_all or answer == "y")


def run(cmd: str):
    info(cmd)
    subprocess.run(["bash", "-c", cmd])


def rm(path: str):
    run(f"rm -rf {path}")


def ln(dest: str, src: str):
    run(f"ln -sf {dest} {src}")


def main():
    files = [f for f in listdir(".") if f not in ignores]

    for file in files:
        dest = os.path.expanduser(f"~/{file}")
        if os.path.exists(dest):
            if not no_all and (yes_all or confirm(dest)):
                rm(dest)
            else:
                print(f"Skipping {dest}")

        if not os.path.exists(dest):
            prefix = pathlib.Path(__file__).parent.resolve()
            ln(f"{prefix}/{file}", dest)


if __name__ == "__main__":
    main()

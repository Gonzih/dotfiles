import sys.process._
import java.io.File
import java.nio.file.{Files, Paths, Path}
import scala.io.StdIn.readLine
import scala.reflect.io.Directory

val home = System.getProperty("user.home")
val source = System.getProperty("user.dir")
val ignores = List(".git", ".config", ".", "..")
var noAll = false
var yesAll = false

def exists(path: Path): Boolean =
  new File(path.toUri()).exists()

def confirm(f: Path): Boolean = {
  println(s"File $f exists, overwrite? (A/Y/n/N)")
  val answer = readLine()
  if (answer == "A")
    yesAll = true
  if (answer == "N")
    noAll = true
  !noAll && (yesAll || answer == "Y" || answer == "")
}

def rm(p: Path) = {
  val f = new File(p.toUri())
  if (f.isDirectory())
    new Directory(f).deleteRecursively()
  else
    f.delete()
}


def process(file: String): Unit = {
  val src = Paths.get(source, file).toAbsolutePath()
  val dest = Paths.get(home, file).toAbsolutePath()

  if (exists(dest))
    if (!noAll && (yesAll || confirm(dest)))
      println(s"Removing $dest")
      rm(dest)
    else
      println(s"Skipping $dest")

  if (!exists(dest))
    println(s"Linking $dest -> $src")
    Files.createSymbolicLink(dest, src)
}

@main def main(): Unit =
  s"ls -a $source".!!
    .linesIterator
    .filter(!ignores.contains(_))
    .foreach(process)

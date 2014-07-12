import System.Cmd (system)
import System.Exit (exitWith)

getValue :: String -> IO Float
getValue value = do
    content <- readFile $ "/sys/class/power_supply/BAT0/energy_" ++ value
    return $ read $ unwords $ lines content

getMax :: IO Float
getMax = getValue "full"

getNow :: IO Float
getNow = getValue "now"

hibernate :: IO ()
hibernate = do
    code <- system "s-hibernate"
    exitWith code

currentPerc :: IO Float
currentPerc = do
    valueNow <- getNow
    valueMax <- getMax
    return $ valueNow / valueMax * 100

run :: Float -> IO ()
run perc = do
    print (show perc)
    newPerc <- currentPerc
    if perc < 50
      then hibernate
      else run newPerc

main :: IO ()
main = do
    perc <- currentPerc
    run perc

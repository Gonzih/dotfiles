import Control.Concurrent (threadDelay)
import Control.Monad (liftM2)
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
hibernate = system "s-hibernate" >>= exitWith

toPerc :: Float -> Float -> Float
toPerc now max = now / max * 100

currentPerc :: IO Float
currentPerc = liftM2 toPerc getNow getMax

run :: Float -> IO ()
run perc | perc < 50 = hibernate
         | otherwise = print perc
                       >> threadDelay 10000000
                       >> currentPerc >>= run

main :: IO ()
main = currentPerc >>= run

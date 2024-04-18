import Data.List (group, sort)
import Data.Bool (bool)

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = bool "No" "Yes" . all (== 2) . map length . group . sort . map length . group . sort

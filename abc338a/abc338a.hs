import Data.Bool (bool)
import Data.Char (isLower, isUpper)

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve (s:ss) = bool "No" "Yes" $ isUpper s && all isLower ss

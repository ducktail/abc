import Data.Bool (bool)

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = bool "No" "Yes" . and . (tail >>= zipWith (<))

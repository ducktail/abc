import Data.List.Split (splitOn)

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = last . splitOn "."

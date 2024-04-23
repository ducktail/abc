import Data.Bool (bool)

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = bool "Yes" "No" . f . read . drop 3
  where
    f :: Int -> Bool
    f x = x == 0 || x == 316 || x >= 350

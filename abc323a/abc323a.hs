import Data.Bool (bool)

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = bool "No" "Yes" . all (== '0') . f []
  where
    f ls [] = ls
    f ls (_ : a : as) = f (a : ls) as

import Data.Bool (bool)

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve [_, x, y, z] = bool "No" "Yes" $ (x < z) && (z < y) || (x > z) && (z > y)

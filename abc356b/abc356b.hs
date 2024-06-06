import Control.Monad (replicateM)
import Data.List (transpose)
import Data.Bool (bool)

main :: IO ()
main = do
  [n, _] <- f
  solve <$> f <*> replicateM n f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [[Int]] -> String
solve as xss = bool "No" "Yes" $ all f $ zip as xs
  where
    xs = map sum $ transpose xss
    f (a, x) = a <= x

import Control.Applicative

main :: IO ()
main = solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve [n, m, p]
  | n < m = 0
  | otherwise = (n - m) `div` p + 1

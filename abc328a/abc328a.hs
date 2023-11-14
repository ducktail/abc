main :: IO ()
main = do
  [n, x] <- f
  solve x <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> Int
solve x = sum . filter (<= x)

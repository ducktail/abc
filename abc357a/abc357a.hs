main :: IO ()
main = do
  [_, m] <- f
  solve m <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> Int
solve m = length . takeWhile (<= m) . scanl1 (+)

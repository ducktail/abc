main :: IO ()
main = do
  [_, l] <- f
  solve l <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> Int
solve l = length . filter (>= l)

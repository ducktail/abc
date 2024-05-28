main :: IO ()
main = do
  solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve [a, b]
  | a == b = -1
  | otherwise = 6 - a - b

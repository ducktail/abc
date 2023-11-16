main :: IO ()
main = getLine >> solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve = sum . map f . zip [1..]
  where
    f (i, d)
      | i < 10 && d < i = 0
      | i < 10 && d < i * 11 = 1
      | i < 10 = 2
      | i `mod` 11 == 0 = let j = i `div` 11 in if d < j then 0 else if d < i then 1 else 2
      | otherwise = 0

main :: IO ()
main = getLine >> solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve = negate . sum

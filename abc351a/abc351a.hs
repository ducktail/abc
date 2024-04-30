main :: IO ()
main = solve <$> f <*> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int] -> Int
solve as bs = sum as - sum bs + 1

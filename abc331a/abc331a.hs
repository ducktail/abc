main :: IO ()
main = unwords <$> map show <$> (solve <$> f <*> f) >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int] -> [Int]
solve [mm, dd] [y, m, d]
  | mm == m && dd == d = [y + 1, 1, 1]
  | dd == d = [y, m + 1, 1]
  | otherwise = [y, m, d + 1]

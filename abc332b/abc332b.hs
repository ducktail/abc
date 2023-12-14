main :: IO ()
main = unwords <$> map show <$> solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int]
solve [k, gg, mm] = foldr id [0, 0] $ replicate k f
  where
    f [g, m]
      | g == gg = [0, m]
      | m == 0 = [g, mm]
      | otherwise = let mn = min (gg - g) m in [g + mn, m - mn]

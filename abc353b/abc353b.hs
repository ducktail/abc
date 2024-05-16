main :: IO ()
main = do
  [_, k] <- f
  solve k <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> Int
solve k = (+ 1) . fst . foldl f (0, k)
  where
    f (ct, sp) a
      | sp >= a = (ct, sp - a)
      | otherwise = (ct + 1, k - a)

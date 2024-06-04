main :: IO ()
main = unwords <$> map show <$> solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int]
solve [n, l, r] = as ++ reverse bs' ++ cs
  where
    (as, bs) = splitAt (l - 1) [1..n]
    (bs', cs) = splitAt (r - l + 1) bs

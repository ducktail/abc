{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = do
  [_, k, x] <- f
  unwords <$> map show <$> solve k x <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: Int -> Int -> [Int] -> [Int]
solve k x = f . splitAt k
  where
    f (ys, xs) = ys ++ x:xs

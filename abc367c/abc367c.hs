{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = do
  [_, k] <- f
  solve k <$> f >>= mapM_ (putStrLn . unwords . map show)
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> [[Int]]
solve k = filter ((== 0) . flip mod k . sum) . f
  where
    f [] = [[]]
    f (x:xs) = do
      y <- [1..x]
      ys <- f xs
      return (y : ys)

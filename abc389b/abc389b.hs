{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> readLn >>= print

solve :: Int -> Int
solve = f 2
  where
    f x n
      | n == 1 = x - 1
      | otherwise = f (x + 1) (n `div` x)

{-# LANGUAGE OverloadedStrings #-}
import Data.List (unfoldr)

main :: IO ()
main = solve <$> readLn >>= f
  where
    f xs = do
      print $ length xs
      putStrLn $ unwords $ map show xs

solve :: Int -> [Int]
solve m = concat $ unfoldr f (0, m)
  where
    f (i, x)
      | x == 0 = Nothing
      | otherwise = case divMod x 3 of
                      (q, 0) -> Just ([], (i + 1, q))
                      (q, 1) -> Just ([i], (i + 1, q))
                      (q, _) -> Just ([i, i], (i + 1, q))

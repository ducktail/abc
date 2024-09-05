{-# LANGUAGE OverloadedStrings #-}
import Control.Monad

main :: IO ()
main = do
  n <- readLn
  solve <$> replicateM n f >>= print
  where
    f = words <$> getLine

solve :: [[String]] -> Int
solve ass = g (f "L" ass) + g (f "R" ass)
  where
    f :: String -> [[String]] -> [Int]
    f x = map (\[a, _] -> read a) . filter (\[_, s] -> s == x)
    g :: [Int] -> Int
    g [] = 0
    g xs = sum $ (tail >>= zipWith (\x y -> abs (x - y))) xs

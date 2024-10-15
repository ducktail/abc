{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM)

main :: IO ()
main = do
  n <- readLn
  solve <$> replicateM n f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [[Int]] -> Double
solve xys = foldl f 0.0 $ (tail >>= zip) xys'
  where
    xys' = [[0, 0]] ++ xys ++ [[0, 0]]
    f l p = l + dist p
    dist :: ([Int],[Int]) -> Double
    dist ([x0, y0], [x1, y1]) = sqrt $ fromIntegral $ (x1 - x0) ^ 2 + (y1 - y0) ^ 2

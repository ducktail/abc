{-# LANGUAGE OverloadedStrings #-}
import Data.List (sort, group)

main :: IO ()
main = solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve = sum . map (flip div 2 . length) . group . sort

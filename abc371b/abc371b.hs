{-# LANGUAGE OverloadedStrings #-}

import Control.Monad
import Data.Set (Set)
import qualified Data.Set as S

main :: IO ()
main = do
  [_, m] <- f
  solve <$> replicateM m g >>= mapM_ putStrLn
  where
    f = map read <$> words <$> getLine
    g = words <$> getLine

solve :: [[String]] -> [String]
solve = reverse . snd . foldl f (S.empty, [])
  where
    f (st, ls) [a, b]
      | b == "F" = (st, "No" : ls)
      | S.member a st = (st, "No" : ls)
      | otherwise = (S.insert a st, "Yes" : ls)

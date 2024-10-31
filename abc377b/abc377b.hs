{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM)
import Data.List (transpose)

main :: IO ()
main = solve <$> replicateM 8 getLine >>= print

solve :: [String] -> Int
solve = (*) <$> f . transpose <*> f
  where
    f = length . filter (== "........")

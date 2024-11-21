{-# LANGUAGE OverloadedStrings #-}

import Data.List (sort, unfoldr, group)
import Data.Bool (bool)

main :: IO ()
main = solve <$> readLn >>= putStrLn

solve :: Int -> String
solve = bool "No" "Yes" . f . group . sort . unfoldr (\x -> if x == 0 then Nothing else let (q, r) = x `divMod` 10 in Just (r, q))
  where
    f = (== [[1], [2, 2], [3, 3, 3]])

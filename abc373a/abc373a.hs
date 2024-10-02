{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM)

main :: IO ()
main = solve <$> replicateM 12 getLine >>= print

solve :: [String] -> Int
solve = length .filter (uncurry (==)) . zip [1..12] . map length

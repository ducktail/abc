{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM)
import Data.Bool (bool)

main :: IO ()
main = do
  n <- readLn
  solve n <$> replicateM n getLine >>= putStrLn

solve :: Int -> [String] -> String
solve n = bool "No" "Yes" . (== n) . fst . foldl f (0, 0)
  where
    f (ct, sw) s
      | sw == 2 = (ct, sw)
      | s == "sweet" = (ct + 1, sw + 1)
      | otherwise = (ct + 1, 0)

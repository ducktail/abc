{-# LANGUAGE OverloadedStrings #-}

import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T
import Data.List ((\\))

main :: IO ()
main = do
  [n, m] <- f
  as <- f
  solve n m as
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: Int -> Int -> [Int] -> IO ()
solve n m as = do
  print $ n - m
  putStrLn $ unwords $ map show $ [1..n] \\ as

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

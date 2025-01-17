{-# LANGUAGE OverloadedStrings #-}

import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T
import Data.List (sort)

main :: IO ()
main = do
  solve <$> f >>= T.putStrLn
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: [Int] -> Text
solve abc
  | a == c = "Yes"
  | a + b == c = "Yes"
  | otherwise = "No"
  where
    [a, b, c] = sort abc

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

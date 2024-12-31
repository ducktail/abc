{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (replicateM)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = do
  n <- readLn
  solve <$> replicateM n f >>= print
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: [[Int]] -> Int
solve = snd . foldl f (0, 0)
  where
    f (ti, vi) [tj, vj] = (tj, vj + max 0 (vi - tj + ti))

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

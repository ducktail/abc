{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (replicateM)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = do
  [n, r] <- f
  solve r <$> replicateM n f >>= print
  where
    f = map (readtx (T.signed T.decimal)) <$> T.words <$> T.getLine

solve :: Int -> [[Int]] -> Int
solve = foldl (\rn [d, a] -> f rn d a)
  where
    f r 1 a = if 1600 <= r && r < 2800 then r + a else r
    f r 2 a = if 1200 <= r && r < 2400 then r + a else r

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

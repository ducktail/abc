{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (replicateM)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T
import Data.List(find)

main :: IO ()
main = do
  [n, m] <- f
  unwords <$> map show <$> (solve n m <$> replicateM n T.getLine <*> replicateM m T.getLine) >>= putStrLn
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: Int -> Int -> [Text] -> [Text] -> [Int]
solve n m ss ts = maybe [] id $ find f [[i, j] | i <- [1..n-m+1], j <- [1..n-m+1]]
  where
    f [i, j] = ts == (map (T.take m . T.drop (j - 1)) $ take m $ drop (i - 1) ss)

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

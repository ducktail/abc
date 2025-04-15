{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (replicateM, foldM_)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = do
  q <- readLn
  qs <- replicateM q f
  solve qs
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: [[Int]] -> IO ()
solve qs = do
  foldM_ f [] qs
  where
    f st q = do
      case q of
        [1, x] -> return (x:st)
        _ -> case st of
          (y:ys) -> do
            print y
            return ys
          [] -> do
            print 0
            return []

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

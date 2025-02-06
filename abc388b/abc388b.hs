{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = do
  [n, d] <- f
  solve d <$> replicateM n f >>= mapM_ print
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: Int -> [[Int]] -> [Int]
solve d tls = do
  k <- [1..d]
  return $ maximum $ map (\[t, l] -> t * (l + k)) tls

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

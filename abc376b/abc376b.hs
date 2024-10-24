{-# LANGUAGE OverloadedStrings #-}
import Control.Monad
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = do
  [n, q] <- g
  solve n <$> replicateM q f >>= print
  where
    f = do
      [h, t] <- T.words <$> T.getLine
      return (h, readtx T.decimal t)
    g = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: Int -> [(Text, Int)] -> Int
solve n = fst . foldl g (0, (1, 2))
  where
    f s d g
      | s < d && s < g && g < d = n - d + s
      | s < d = d - s
      | d < g && g < s = n - s + d
      | otherwise = s - d
    g (ct, (l, r)) (h, t)
      | h == "L" = (ct + f l t r, (t, r))
      | otherwise = (ct + f r t l, (l, t))

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

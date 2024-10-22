{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = do
  [_, c] <- f
  solve c <$> f >>= print
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: Int -> [Int] -> Int
solve c = fst . foldl f (0, -c)
  where
    f (ct, gt) t
      | gt + c <= t = (ct + 1, t)
      | otherwise = (ct, gt)

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

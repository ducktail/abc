{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = T.getLine >> solve <$> f >>= print
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: [Int] -> Int
solve = f 0
  where
    f t (h:hs)
      | h >= 5 = f (t + h `div` 5 * 3) (h `mod` 5 : hs)
      | h <= 0 = f t hs
      | (t + 1) `mod` 3 == 0 = f (t + 1) (h - 3 : hs)
      | otherwise = f (t + 1) (h - 1 : hs)
    f t [] = t

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

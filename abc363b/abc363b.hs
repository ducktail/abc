{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T
import Data.List (sort)

main :: IO ()
main = solve <$> f <*> f >>= print
  where
    f = map (readtx (T.signed T.decimal)) <$> T.words <$> T.getLine

solve :: [Int] -> [Int] -> Int
solve [n, t, p] = max 0 . (t -) . head . drop (n - p) . sort

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

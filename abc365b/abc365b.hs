{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T
import Data.List (sortBy)

main :: IO ()
main = getLine >> solve <$> f >>= print
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: [Int] -> Int
solve = snd . head . tail . sortBy (flip compare) . flip zip [1..]

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

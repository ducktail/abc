{-# LANGUAGE OverloadedStrings #-}

import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T
import Data.Bool (bool)

main :: IO ()
main = T.getLine >> solve <$> f >>= T.putStrLn
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: [Int] -> Text
solve = bool "No" "Yes" . all (uncurry (>)) . (tail >>= zip)

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

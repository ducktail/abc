{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Bool (bool)

main :: IO ()
main = T.getLine >> solve <$> f >>= print
  where
    f = T.words <$> T.getLine

solve :: [Text] -> Int
solve = foldl f 0 . ((tail . tail) >>= zip)
  where
    f ct (x, y) = bool ct (ct + 1) $ x == y

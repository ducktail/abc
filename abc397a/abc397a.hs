{-# LANGUAGE OverloadedStrings #-}

import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = solve <$> f >>= print
  where
    f = readtx T.double <$> T.getLine

solve :: Double -> Int
solve x = 
  if x >= 38.0 then 1
  else if x >= 37.5 then 2
  else 3

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

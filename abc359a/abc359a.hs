{-# LANGUAGE OverloadedStrings #-}
import Control.Monad(replicateM)
import Data.Text (Text)
import qualified Data.Text.IO as T

main :: IO ()
main = do
  n <- readLn
  solve <$> replicateM n T.getLine >>= print

solve :: [Text] -> Int
solve = length . filter (== "Takahashi")

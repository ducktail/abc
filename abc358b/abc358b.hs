{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import qualified Data.Text.Read as T

main :: IO ()
main = do
  [_, a] <- f
  solve a <$> f >>= mapM_ print
  where
    f = map g <$> T.words <$> T.getLine
    g = either (const (-1)) fst . T.decimal

solve :: Int -> [Int] -> [Int]
solve a = tail . scanl f 0
  where
    f ct t = max ct t + a

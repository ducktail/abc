{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.List(sortOn)

main :: IO ()
main = do
  n <- readLn
  solve <$> replicateM n T.getLine >>= T.putStrLn

solve :: [Text] -> Text
solve = T.concat . sortOn T.length

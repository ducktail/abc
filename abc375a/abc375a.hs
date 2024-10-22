[{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Bool (bool)

main :: IO ()
main = do
  T.getLine
  solve <$> T.getLine >>= print

solve :: Text -> Int
solve = foldl f 0 . T.tails
  where
    f c = (+ c) . bool 0 1 . T.isPrefixOf "#.#"
]

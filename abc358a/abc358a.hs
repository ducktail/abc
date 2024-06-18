{-# LANGUAGE OverloadedStrings #-}

import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Bool (bool)

main :: IO ()
main = solve <$> f >>= T.putStrLn
  where
    f = T.words <$> T.getLine

solve :: [Text] -> Text
solve [a, b] = bool "No" "Yes" $ a == "AtCoder" && b == "Land"

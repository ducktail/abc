{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = solve <$> T.getLine >>= print

solve :: Text -> Int
solve = T.length . T.replace "00" "a"

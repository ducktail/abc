{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T
import Data.List (sortBy)

main :: IO ()
main = T.getLine >> solve <$> f >>= print
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: [Int] -> Int
solve xs = f 0 (sortBy (flip compare) xs)
  where
    f :: Int -> [Int] -> Int
    f ct (y:z:zs)
      | z == 0 = ct
      | otherwise = f (ct + 1) (sortBy (flip compare) (y-1:z-1:zs))
    f _ _ = 0

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

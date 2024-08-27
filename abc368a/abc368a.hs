{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = do
  [n, k] <- f
  unwords <$> map show <$> solve n k <$> f >>= putStrLn
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: Int -> Int -> [Int] -> [Int]
solve n k as = ys ++ xs
  where
    (xs, ys) = splitAt (n - k) as

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

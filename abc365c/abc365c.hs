{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T

main :: IO ()
main = do
  solve <$> f <*> f >>= putStrLn
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: [Int] -> [Int] -> String
solve [n, m] as
  | sum as <= m = "infinite"
  | otherwise = show $ bsearch 0 10000000000 (\x -> sum (map (min x) as) <= m)

bsearch :: Int -> Int -> (Int -> Bool) -> Int
bsearch xok xng f
  | xok + 1 == xng = xok
  | f x = bsearch x xng f
  | otherwise= bsearch xok x f
  where
    x = (xok + xng) `div` 2
    
readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

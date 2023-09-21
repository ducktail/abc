import Control.Applicative
import Data.List

main :: IO ()
main = solve <$> getLine >>= print

solve :: String -> Int
solve s = foldl (\a x -> max a (loPalin x)) 0 l
  where
    l = do
      xs <- tails s
      inits xs

loPalin :: String -> Int
loPalin s
  | f s = length s
  | otherwise = 0
  where
    f = reverse >>= (==)

import Control.Applicative
import Data.List

main :: IO ()
main = getLine >> solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve = maybe 0 f . find g . h . sort
  where
    f (a, b) = (a + b) `div` 2
    g (a, b) = a == b + 2
    h = tail >>= zip

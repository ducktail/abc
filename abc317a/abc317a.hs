import Control.Applicative
import Data.List

main :: IO ()
main = do
  [_, h, x] <- f
  solve (x - h) <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> Int
solve d = maybe 0 fst . find f . zip [1..]
  where
    f (_, p) = p >= d

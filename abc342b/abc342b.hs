import Control.Monad
import Data.Vector.Unboxed (Vector, (!), (//))
import qualified Data.Vector.Unboxed as V

main :: IO ()
main = do
  n <- readLn
  ps <- f
  q <- readLn
  solve n ps <$> replicateM q f >>= mapM_ print
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> [[Int]] -> [Int]
solve n ps qs = map (\[a, b] -> if v ! a < v ! b then a else b) qs
  where
    v = V.replicate (n + 1) 0 // (zip ps [0..]) :: Vector Int

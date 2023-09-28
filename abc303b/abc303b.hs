import Control.Monad
import Data.ByteString.Char8 (ByteString)
import qualified Data.ByteString.Char8 as B
import Data.List
import Data.Char (isSpace)
import qualified Data.IntSet as IS

main :: IO ()
main = do
  [n, m] <- f
  solve n <$> replicateM m f >>= print
  where
    f = readil B.readInt <$> B.getLine

solve :: Int -> [[Int]] -> Int
solve n as = flip div 2 $ IS.size $ IS.difference ast nst
  where
    ast = foldl (\st (i, j) -> IS.insert (100 * i + j) (IS.insert (100 * j + i) st)) IS.empty [(i, j) | i <- [1..n-1], j <- [i+1 .. n]]
    nst = foldl (\st a -> foldl (\s (i, j) -> IS.insert (100 * i + j) (IS.insert (100 * j + i) s)) st (zip a (tail a))) IS.empty as

readil :: Integral a =>  (ByteString -> Maybe (a, ByteString)) -> ByteString -> [a]
readil f = unfoldr $ f . B.dropWhile isSpace

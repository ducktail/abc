import Control.Monad
import Data.ByteString.Char8 (ByteString)
import qualified Data.ByteString.Char8 as B
import Data.List
import Data.Char (isSpace)

main :: IO ()
main = do
  n <- readLn
  solve <$> f <*> replicateM (n - 1) f >>= print
  where
    f = readil B.readInt <$> B.getLine

solve :: [Int] -> [[Int]] -> Int
solve as sts = foldl2 f (head as) (tail as) sts
  where
    f x a [s, t] = a + x `div` s * t

readil :: Integral a =>  (ByteString -> Maybe (a, ByteString)) -> ByteString -> [a]
readil f = unfoldr $ f . B.dropWhile isSpace

foldl2 :: (a -> b -> c -> a) -> a -> [b] -> [c] -> a
foldl2 f a bs cs = foldl (\x (y, z) -> f x y z) a (zip bs cs)

import Data.ByteString.Char8 (ByteString)
import qualified Data.ByteString.Char8 as B
import Data.List
import Data.Char (isSpace)
import qualified Data.IntMap.Strict as IM

main :: IO ()
main = getLine >> solve <$> f >>= print
  where
    f = readil B.readInt <$> B.getLine

solve :: [Int] -> Int
solve = IM.foldl g 0 . foldl f IM.empty
  where
    f is a = IM.insertWith (+) a 1 is
    g c x = c + x `div` 2

readil :: Integral a =>  (ByteString -> Maybe (a, ByteString)) -> ByteString -> [a]
readil f = unfoldr $ f . B.dropWhile isSpace

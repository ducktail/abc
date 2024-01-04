import Data.ByteString.Char8 (ByteString)
import qualified Data.ByteString.Char8 as B
import Data.List
import Data.Char (isSpace)

main :: IO ()
main = getLine >> solve <$> f <*> f >>= mapM_ putStrLn
  where
    f = readil B.readInt <$> B.getLine

solve :: [Int] -> [Int] -> [String]
solve as bs = f [] [] 1 as bs
  where
    f xs ys _ [] [] = [unwords . map show .reverse $ xs, unwords . map show . reverse $ ys]
    f xs ys i (a:as) [] = f (i:xs) ys (i + 1) as []
    f xs ys i [] (b:bs) = f xs (i:ys) (i + 1) [] bs
    f xs ys i (a:as) (b:bs)
      | a < b = f (i:xs) ys (i + 1) as (b:bs)
      | otherwise = f xs (i:ys) (i + 1) (a:as) bs


readil :: Integral a =>  (ByteString -> Maybe (a, ByteString)) -> ByteString -> [a]
readil f = unfoldr $ f . B.dropWhile isSpace

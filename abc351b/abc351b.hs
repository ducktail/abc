import Control.Monad
import Text.Printf

main :: IO ()
main = do
  n <- readLn
  as <- replicateM n getLine
  bs <- replicateM n getLine
  solve as bs

solve :: [String] -> [String] -> IO ()
solve as bs = do
  f 1 1 as bs
  where
    f :: Int -> Int -> [String] -> [String] -> IO ()
    f i j ([]:xss) ([]:yss) = f (i + 1) 1 xss yss
    f i j ((x:xs):xss) ((y:ys):yss)
      | x == y = f i (j + 1) (xs:xss) (ys:yss)
      | otherwise = printf "%d %d\n" i j

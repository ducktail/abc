import Control.Applicative
import Control.Monad
import Control.Monad.ST
import Data.Array.ST

main :: IO ()
main = do
  n <- readLn
  solve <$> replicateM n f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [[Int]] -> Int
solve cds = runST $ do
  arr <- newArray ((0, 0), (100, 100)) 0 :: ST s (STArray s (Int, Int) Int)
  forM_ cds $ \[a, b, c, d] -> do
    modifyArray arr (a, c) (+ 1)
    modifyArray arr (b, d) (+ 1)
    modifyArray arr (a, d) (subtract 1)
    modifyArray arr (b, c) (subtract 1)
  forM_ (range ((0, 0), (99, 100))) $ \(x, y) -> do
    m <- readArray arr (x, y)
    n <- readArray arr (x + 1, y)
    writeArray arr (x + 1, y) (m + n)
  forM_ (range ((0, 0), (100, 99))) $ \(x, y) -> do
    m <- readArray arr (x, y)
    n <- readArray arr (x, y + 1)
    writeArray arr (x, y + 1) (m + n)
  foldM (f arr) 0 $ range ((0, 0), (100, 100))
  where
    f arr ct p = do
      m <- readArray arr p
      if m > 0 then return (ct + 1) else return ct

modifyArray :: STArray s (Int, Int) Int -> (Int, Int) -> (Int -> Int) -> ST s ()
modifyArray ar p f = do
  x <- readArray ar p
  writeArray ar p (f x)

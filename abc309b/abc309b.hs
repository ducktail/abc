import Control.Monad (forM_)
import Data.Array.IO

main :: IO ()
main = do
  n <- readLn
  ar <- newArray ((0, 0), (n - 1, n - 1)) '0' :: IO (IOUArray (Int, Int) Char)
  forM_ [0 .. n - 1] $ \i -> do
    s <- getLine
    forM_ (zip [0 .. n - 1] s) $ \(j, c) -> do
      writeArray ar (i, j) c
  t <- readArray ar (0, 0)
  forM_ [0 .. n - 2] $ \i -> readArray ar (i + 1, 0) >>= writeArray ar (i, 0)
  forM_ [0 .. n - 2] $ \i -> readArray ar (n - 1, i + 1) >>= writeArray ar (n - 1, i)
  forM_ [n - 1, n - 2 .. 1] $ \i -> readArray ar (i - 1, n - 1) >>= writeArray ar (i, n - 1)
  forM_ [n - 1, n - 2 .. 1] $ \i -> readArray ar (0, i - 1) >>= writeArray ar (0, i)
  writeArray ar (0, 1) t
  forM_ [0 .. n - 1] $ \i -> do
    forM_ [0 .. n - 1] $ \j -> do
      readArray ar (i, j) >>= putChar
    putStrLn ""

{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (forM_)
import Data.Array.IO

main :: IO ()
main = do
  n <- readLn
  fld <- newArray ((1, 1), (n, n)) '.'
  solve n fld >>= printArray n

solve :: Int -> IOUArray (Int, Int) Char -> IO (IOUArray (Int, Int) Char)
solve n a = do
  forM_ idx $ \(lu, rb) -> do
    forM_ [lu..rb] $ \i -> do
      writeArray a (lu, i) '#'
      writeArray a (rb, i) '#'
      writeArray a (i, lu) '#'
      writeArray a (i, rb) '#'
  return a
  where
    idx = takeWhile (\(i, j) -> i <= j) $ zip [1, 3 ..] [n, n-2 ..]

printArray :: Int -> IOUArray (Int, Int) Char -> IO ()
printArray n a = do
  forM_ [1..n] $ \r -> do
    forM_ [1..n] $ \c -> do
      x <- readArray a (r, c)
      putChar x
    putChar '\n'

{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM, foldM)
import Data.Array.IO

main :: IO ()
main = do
  [h, w] <- f
  [si, sj] <- f
  css <- replicateM h getLine
  xs <- getLine
  solve h w si sj css xs >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: Int -> Int -> Int -> Int -> [String] -> String -> IO String
solve h w si sj css xs = do
  arc <- newListArray ((1,1), (h, w)) (concat css) :: IO (IOUArray (Int, Int) Char)
  (y, x) <- foldM (\(r, c) x -> do
                      if x == 'L' && 1 < c then do
                        t <- readArray arc (r, c - 1)
                        if t == '.' then return (r, c - 1) else return (r, c)
                      else if x == 'R' && c < w then do
                        t <- readArray arc (r, c + 1)
                        if t == '.' then return (r, c + 1) else return (r, c)
                      else if x == 'U' && 1 < r then do
                        t <- readArray arc (r - 1, c)
                        if t == '.' then return (r - 1, c) else return (r, c)
                      else if x == 'D' && r < h then do
                        t <- readArray arc (r + 1, c)
                        if t == '.' then return (r + 1, c) else return (r, c)
                      else return (r, c)) (si, sj) xs
  return $ unwords $ map show [y, x]

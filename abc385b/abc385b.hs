{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM)
import qualified Data.Set as S
import Data.Array.Unboxed

main :: IO ()
main = do
  [h, w, x, y] <- f
  ss <- replicateM h getLine
  unwords <$> map show <$> solve h w x y ss <$> getLine >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: Int -> Int -> Int -> Int -> [String] -> String -> [Int]
solve h w x y ss t =
  let ((ar, ac), ast) = 
        foldl (\((r, c), st) d ->
                 let (nr, nc) = np (r, c) d in
                   if 1 <= nr && nr <= h && 1 <= nc && nc <= w then
                     if fld ! (nr, nc) == '.' then ((nr, nc), st)
                     else if fld ! (nr, nc) == '@' then ((nr, nc), S.insert (nr, nc) st)
                     else ((r, c), st)
                   else ((r, c), st)
              ) ((x, y), S.empty) t in
    [ar, ac, S.size ast]
  where
    fld = listArray ((1, 1), (h, w)) $ concat ss :: Array (Int, Int) Char
    np (r, c) d
      | d == 'U' = (r - 1, c)
      | d == 'D' = (r + 1, c)
      | d == 'L' = (r , c - 1)
      | otherwise = (r , c + 1)

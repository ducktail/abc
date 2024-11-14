{-# LANGUAGE OverloadedStrings #-}
import Data.List (unfoldr)

main :: IO ()
main = solve <$> f <*> getLine >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String -> Int
solve [_, k] = sum . unfoldr f
  where
    f s = if null s then Nothing
      else let (a, b) = span (== 'O') s in Just (length a `div` k, dropWhile (== 'X') b)

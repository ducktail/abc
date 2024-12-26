{-# LANGUAGE OverloadedStrings #-}
main :: IO ()
main = do
  solve <$> f <*> getLine >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String -> Int
solve [n, d] s = n + d - c
  where
    c = length $ filter (== '@') s

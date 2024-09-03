{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve [a, b]
  | a == b = 1
  | even (a + b) = 3
  | otherwise = 2

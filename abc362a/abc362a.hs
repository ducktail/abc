{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> f <*> getLine >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String -> Int
solve [_, g, b] "Red" = min g b
solve [r, _, b] "Green" = min r b
solve [r, g, _] "Blue" = min r g
solve _ _ = 0

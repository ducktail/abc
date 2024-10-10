{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> getLine <*> getLine >>= print

solve :: String -> String -> Int
solve = f 1
  where
    f i [] [] = 0
    f i [] _ = i
    f i _ [] = i
    f i (s : ss) (t : ts)
      | s == t = f (i + 1) ss ts
      | otherwise = i

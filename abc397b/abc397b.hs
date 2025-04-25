{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> getLine >>= print

solve :: String -> Int
solve s
  | odd (ls + ic) = ic + 1
  | head s == 'o' = ic + 2
  | otherwise = ic
  where
    ls = length s
    ic = length $ filter (uncurry (==)) $ zip <*> tail $ s

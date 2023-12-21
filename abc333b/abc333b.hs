import Data.Bool (bool)

main :: IO ()
main = solve <$> getLine <*> getLine >>= putStrLn

solve :: String -> String -> String
solve ss tt = bool "No" "Yes" $ dist ss == dist tt

dist :: String -> Int
dist (x:y:_) = min c (5 - c)
  where
    a = toNum x
    b = toNum y
    c = abs $ a - b

toNum :: Char -> Int
toNum 'A' = 0
toNum 'B' = 1
toNum 'C' = 2
toNum 'D' = 3
toNum _ = 4

import Data.List (find)

main :: IO ()
main = solve <$> getLine >>= print

solve :: String -> Int
solve (a:b:c:cs)
  | a == b = maybe 0 fst $ find ((/= a) . snd) $ zip [3..] (c:cs)
  | a == c = 2
  | otherwise = 1

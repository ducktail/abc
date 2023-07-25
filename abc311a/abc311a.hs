import Control.Applicative

main :: IO ()
main = getLine >> solve <$> getLine >>= print

solve :: String -> Int
solve = f 0 0 0 0
  where
    f i a b c (x:xs)
      | a > 0 && b > 0 && c > 0 = i
      | x == 'A' = f (i + 1) (a + 1) b c xs
      | x == 'B' = f (i + 1) a (b + 1) c xs
      | otherwise = f (i + 1) a b (c + 1) xs
    f i _ _ _ [] = i

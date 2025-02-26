{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = getLine >> solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve (a:b:c:cs)
  | b * b == a * c = solve (b:c:cs)
  | otherwise = "No"
solve _ = "Yes"

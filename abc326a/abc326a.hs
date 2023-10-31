main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve [x, y]
  | y > 2 + x = "No"
  | y < x - 3 = "No"
  | otherwise = "Yes"

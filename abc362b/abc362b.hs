{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> f <*> f <*> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int] -> [Int] -> String
solve pa pb pc
  | f pa pb pc == 0 = "Yes"
  | f pb pc pa == 0 = "Yes"
  | f pc pa pb == 0 = "Yes"
  | otherwise = "No"
  where
    f [x0, y0] [x1, y1] [x2, y2] = (x1 - x0) * (x2 - x0) + (y1 - y0) * (y2 - y0)

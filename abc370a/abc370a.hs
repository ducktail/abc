{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve [l, r] =
  case 2 * l + r of
    1 -> "No"
    2 -> "Yes"
    _ -> "Invalid"

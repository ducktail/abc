{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> f <*> getLine >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String -> String
solve [n, d] = fst . foldr f ("", d)
  where
    f c (rs, day)
      | day == 0 = (c : rs, day)
      | c == '@' = ('.' : rs, day - 1)
      | otherwise = (c : rs, day)

{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> readLn >>= putStrLn

solve :: Int -> String
solve n = mn ++ eq ++ mn
  where
    mn = replicate ((n - 1) `div` 2) '-'
    eq = replicate (2 - n `mod` 2) '='

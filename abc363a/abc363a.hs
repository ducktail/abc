{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> readLn >>= print

solve :: Int -> Int
solve = (100 -) . flip mod 100

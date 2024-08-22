{-# LANGUAGE OverloadedStrings #-}
main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = reverse . dropWhile (== '.') . dropWhile (== '0') . reverse

{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> words <$> getLine >>= print

solve :: [String] -> Int
solve ["fine", "fine"] = 4
solve ["fine", "sick"] = 3
solve ["sick", "fine"] = 2
solve _ = 1

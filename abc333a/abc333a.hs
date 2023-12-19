main :: IO ()
main = solve <$> readLn >>= putStrLn

solve :: Int -> String
solve = head . show >>= flip replicate

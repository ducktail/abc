main :: IO ()
main = solve <$> readLn >>= putStrLn

solve :: Int -> String
solve n = take (2 * n + 1) $ cycle "10"

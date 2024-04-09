main :: IO ()
main = solve <$> readLn >>= putStrLn

solve :: Int -> String
solve n = take n $ cycle "oox"

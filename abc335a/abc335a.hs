main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve s = init s ++ "4"

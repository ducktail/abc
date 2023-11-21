main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = unwords . map return

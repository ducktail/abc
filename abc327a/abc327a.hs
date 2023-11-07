main :: IO ()
main = getLine >> solve <$> getLine >>= putStrLn

solve :: String -> String
solve ('a':'b':_) = "Yes"
solve ('b':'a':_) = "Yes"
solve [_] = "No"
solve (c:cs) = solve cs

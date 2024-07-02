{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve ('R':_) = "Yes"
solve "SRM" = "Yes"
solve _ = "No"

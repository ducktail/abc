import Control.Applicative

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = filter (flip notElem "aeiou")

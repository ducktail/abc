import Control.Applicative

main :: IO ()
main = getLine >> solve <$> getLine >>= putStrLn

solve :: String -> String
solve = snd . foldr f (True, [])
  where
    f c (o, s)
      | c == '"' = (not o, c : s)
      | o && c == ',' = (o, '.' : s)
      | otherwise = (o, c : s)

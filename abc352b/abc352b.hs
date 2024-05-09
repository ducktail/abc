main :: IO ()
main = unwords <$> map show <$> (solve <$> getLine <*> getLine) >>= putStrLn

solve :: String -> String -> [Int]
solve = f 1
  where
    f _ [] _ = []
    f i (s:ss) (t:ts)
      | s == t = i : f (i + 1) ss ts
      | otherwise = f (i + 1) (s:ss) ts

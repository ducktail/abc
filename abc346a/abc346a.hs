main :: IO ()
main = getLine >> unwords <$> map show <$> solve <$> f >>= putStrLn
  where
    f = map read  <$> words <$> getLine

solve :: [Int] -> [Int]
solve = tail >>= zipWith (*)

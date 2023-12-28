main :: IO ()
main = do
  [_, l, r] <- f
  unwords <$> map (show . solve l r) <$> f  >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: Int -> Int -> Int -> Int
solve l r a
  | a < l = l
  | r < a = r
  | otherwise= a

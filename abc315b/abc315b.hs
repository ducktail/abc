import Control.Applicative

main :: IO ()
main = unwords <$> map show <$> (solve <$> readLn <*> f) >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> [Int]
solve n ds = f md $ zip [1..] ds
  where
    md = (sum ds + 1) `div` 2
    f rd ((i, d) : rs)
      | d >= rd = [i, rd]
      | otherwise = f (rd - d) rs

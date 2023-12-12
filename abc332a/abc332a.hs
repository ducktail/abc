import Control.Monad (replicateM)

main :: IO ()
main = do
  [n, s, k] <- f
  solve s k <$> replicateM n f >>= print
  where
    f = map read <$> words <$> getLine

solve :: Int -> Int -> [[Int]] -> Int
solve s k pqs
  | sm >= s = sm
  | otherwise = sm + k
  where
    sm = sum $ map (\[p, q] -> p * q) pqs

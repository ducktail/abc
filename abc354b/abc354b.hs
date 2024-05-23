import Control.Monad (replicateM)
import Data.List (sort)

main :: IO ()
main = do
  n <- readLn
  solve n <$> replicateM n f >>= putStrLn
  where
    f = words <$> getLine

solve :: Int -> [[String]] -> String
solve n scs = head $ head $ flip drop sscs $ flip mod n $ foldl f 0 scs
  where
    f :: Int -> [String] -> Int
    f ct [s, c] = ct + read c
    sscs = sort scs

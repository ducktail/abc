import Control.Monad (replicateM)

main :: IO ()
main = do
  n <- readLn
  map (unwords . map show . solve) <$> replicateM n f >>= mapM_ putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int]
solve = map fst . filter ((== 1) . snd) . zip [1..]

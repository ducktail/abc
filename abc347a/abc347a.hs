import Data.Maybe(mapMaybe)

main :: IO ()
main = do
  [n, k] <- f
  unwords <$> map show <$> solve k <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> [Int]
solve k = mapMaybe f
  where
    f x
      | x `mod` k == 0 = Just $ x `div` k
      | otherwise = Nothing

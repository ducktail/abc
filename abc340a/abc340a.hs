import Data.List (unfoldr)

main :: IO ()
main = unwords <$> map show <$> solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int]
solve [a, b, d] = unfoldr (\x -> if x > b then Nothing else Just (x, x + d)) a

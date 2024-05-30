import Data.List(sort, find)

main :: IO ()
main = getLine >> solve <$> f <*> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int] -> String
solve as bs = maybe "No" (const "Yes") $ find (\(x, y) -> x == 0 && y == 0) $ zip ls (tail ls)
  where
    ls = merge (sort as) (sort bs)

merge :: [Int] -> [Int] -> [Int]
merge (a:as) (b:bs)
  | a < b = 0 : merge as (b:bs)
  | otherwise = 1 : merge (a:as) bs
merge [] bs = replicate (length bs) 1
merge as [] = replicate (length as) 0

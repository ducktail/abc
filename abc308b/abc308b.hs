import Control.Applicative

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve as
  | c1 && c2 && c3 = "Yes"
  | otherwise = "No"
  where
    c1 = and $ zipWith (<=) as $ tail as
    c2 = all (\x -> 100 <= x && x <= 675) as
    c3 = all ((== 0) . (flip mod 25)) as

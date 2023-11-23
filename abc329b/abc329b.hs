import Data.List

main :: IO ()
main = getLine >> solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve = head . head . tail . group . sortBy (flip compare)

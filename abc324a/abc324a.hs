import Data.Bool (bool)

main :: IO ()
main = getLine >> solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve = bool "No" "Yes" . and . (tail >>= zipWith (==))
  where
    f = sum . map (^2)

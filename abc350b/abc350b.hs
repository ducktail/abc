import Data.List(sort, group)

main :: IO ()
main = do
  [n, _] <- f
  solve n <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: Int -> [Int] -> Int
solve n = (n -) . length . filter odd . map length . group . sort

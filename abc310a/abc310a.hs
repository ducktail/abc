import Control.Applicative

main :: IO ()
main = solve <$> f <*> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int] -> Int
solve [_, p, q] ds = min p (q + minimum ds)

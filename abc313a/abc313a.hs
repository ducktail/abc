import Control.Applicative

main :: IO ()
main = getLine >> solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve [_] = 0
solve (p : ps) = max 0 $ maximum ps + 1 - p

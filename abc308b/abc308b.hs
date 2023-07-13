import Control.Applicative
import Control.Monad

main :: IO ()
main = getLine >> solve <$> f <*> f <*> g >>= print
  where
    f = words <$> getLine
    g = map read <$> f

solve :: [String] -> [String] -> [Int] -> Int
solve cs ds (p:ps) = sum $ map (maybe p id . flip lookup tbl) cs
  where
    tbl = zip ds ps

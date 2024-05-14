import Data.List (find)

main :: IO ()
main = getLine >> solve <$> f >>= print
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> Int
solve (h:hs) = maybe (-1) fst $ find ((> h).snd) $ zip [2..] hs

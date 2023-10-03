import Data.List

main :: IO ()
main = getLine >> solve <$> getLine >>= print

solve :: String -> Int
solve = maybe (-1) fst . find ((== "ABC") . take 3 . snd) . zip [1..] . tails

import Data.List (find)

main :: IO ()
main = solve <$> readLn >>= print

solve :: Int -> Int
solve n = maybe 0 id $ find f [1..]
  where
    f i = 2 ^ i > n + 1

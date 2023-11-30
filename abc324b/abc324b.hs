import Data.Bool (bool)

main :: IO ()
main = solve <$> readLn >>= putStrLn

solve :: Int -> String
solve = bool "No" "Yes" . (== 1) . divn 2 . divn 3

divn n x
  | x `mod` n == 0 = divn n (x `div` n)
  | otherwise= x

{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = unwords <$> map show <$> solve <$> readLn >>= putStrLn

solve :: Int -> [Int]
solve n = [bc * 10 + a, c * 100 + ab]
  where
    (a, bc) = divMod n 100
    (ab, c) = divMod n 10

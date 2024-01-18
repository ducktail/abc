main :: IO ()
main = solve <$> readLn >>= print

solve :: Int -> Int
solve = f 0
  where
    f c x
      | odd x = c
      | otherwise = f (c + 1) (x `div` 2)

main :: IO ()
main = solve [] >>= mapM_ print

solve :: [Int] -> IO [Int]
solve xs = do
  a <- readLn
  if a == 0 then return (a : xs)
    else solve (a : xs)

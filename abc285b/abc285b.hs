import Control.Applicative

main :: IO ()
main = solve <$> readLn <*> getLine >>= mapM_ print

solve :: Int -> String -> [Int]
solve n s = do
  i <- [1 .. n - 1]
  let l = length $ takeWhile f $ zip s (drop i s)
  return l
  where
    f (a, b) = a /= b

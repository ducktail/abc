import Control.Applicative
import Control.Monad
import Data.List

main :: IO ()
main = solve <$> readLn >>= putStrLn

solve :: Int -> String
solve n = concat $ map f [0..n]
  where
    ls = do
      j <- [1..9]
      guard $ n `mod` j == 0
      return (j, n `div` j)
    f i = maybe "-" (show . fst) $ find (\(x, y) -> i `mod` y == 0) ls

import Control.Monad(replicateM)
import Data.List(transpose)

main :: IO ()
main = do
  n <- readLn
  solve <$> replicateM n f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [[Int]] -> String
solve = f . map sum . transpose
  where
    f [a, b] = case compare a b of
      GT -> "Takahashi"
      LT -> "Aoki"
      EQ -> "Draw"

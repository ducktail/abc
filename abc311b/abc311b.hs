import Control.Applicative
import Control.Monad
import Data.List(transpose)

main :: IO ()
main = do
  [n, _] <- f
  solve <$> replicateM n getLine >>= print
  where
    f = map read <$> words <$> getLine

solve :: [String] -> Int
solve = (max <$> fst <*> snd) . foldl f (0, 0) . map (all (== 'o')) . transpose
  where
    f (h, mxh) b
      | b = (h + 1, mxh)
      | otherwise = (0, max h mxh)

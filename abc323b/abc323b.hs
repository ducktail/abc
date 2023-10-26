import Control.Monad(replicateM)
import Data.List(sortBy)

main :: IO ()
main = do
  n <- readLn
  unwords <$> map show <$> solve <$> replicateM n getLine >>= putStrLn

solve :: [String] -> [Int]
solve = map fst . sortBy f . zip [1..] . map (length . filter (== 'o'))
  where
    f (x, a) (y, b) =
      case compare a b of
        EQ -> compare x y
        LT -> GT
        GT -> LT

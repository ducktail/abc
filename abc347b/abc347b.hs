import Data.List
import qualified Data.Set as S

main :: IO ()
main = solve <$> getLine >>= print

solve :: String -> Int
solve s = subtract 1 $ S.size $ S.fromList ls
  where
    ls = do
      xs <- tails s
      x <- inits xs
      return x

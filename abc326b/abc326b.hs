import Control.Monad
import Data.List (find)

main :: IO ()
main = solve <$> readLn >>= print

solve :: Int -> Int
solve n = maybe 0 id $ find (>= n) l326
  where
    l326 = do
      c <- [1..9]
      x <- [0..9]
      guard $ c * x < 10
      return $ c * 100 + x * 10 + c * x

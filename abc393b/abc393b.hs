{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (guard)
import Data.Vector.Unboxed ((!))
import qualified Data.Vector.Unboxed as V

main :: IO ()
main = solve <$> getLine >>= print

solve :: String -> Int
solve s = length $ do
  let n = length s
      v = V.fromList s
  l <- takeWhile (\x -> 2 * x <= n - 1) [1..]
  i <- [0..n - 1 - 2 * l]
  guard $ v ! i == 'A' && v ! (i + l) == 'B' && v ! (i + 2 * l) == 'C'
  return ()

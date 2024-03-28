import Data.Bool (bool)
import Data.Vector.Unboxed (Vector, (!))
import qualified Data.Vector.Unboxed as V

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> String
solve [w, b] = bool "No" "Yes" $ any (\i -> asm ! (i + w + b) - asm ! i == w) [0..11]
  where
    asm = V.fromList $ take 300 $ scanl (+) 0 $ cycle [1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1] :: Vector Int

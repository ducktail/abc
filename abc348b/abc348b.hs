import Control.Monad
import Data.Vector.Mutable (IOVector)
import qualified Data.Vector.Mutable as VM

main :: IO ()
main = do
  n <- readLn
  vp <- VM.replicate n (0, 0) :: IO (IOVector (Int, Int))
  forM_ [0..n-1] $ \i -> do
    [x, y] <- f
    VM.write vp i (x, y)
  solve n vp
  where
    f = map read <$> words <$> getLine

solve :: Int -> IOVector (Int, Int) -> IO ()
solve n vp = do
  vi <- VM.replicate n 0 :: IO (IOVector Int)
  vl <- VM.replicate n 0 :: IO (IOVector Int)
  forM_ [0..n-2] $ \i -> do
    forM_ [i+1..n-1] $ \j -> do
      (xi, yi) <- VM.read vp i
      (xj, yj) <- VM.read vp j
      let l2 = (xi - xj) * (xi - xj) + (yi - yj) * (yi - yj)
      ii <- VM.read vi i
      li <- VM.read vl i
      when (l2 > li || l2 == li && j < ii) $ do
        VM.write vi i j
        VM.write vl i l2
      ij <- VM.read vi j
      lj <- VM.read vl j
      when (l2 > lj || l2 == lj && i < ij) $ do
        VM.write vi j i
        VM.write vl j l2
  forM_ [0..n-1] $ \i -> do
    x <- VM.read vi i
    print $ x + 1

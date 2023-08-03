import Control.Applicative
import Control.Monad

main :: IO ()
main = do
  [h, _] <- f
  map solve <$> replicateM h getLine >>= mapM_ putStrLn
  where
    f = map read <$> words <$> getLine

solve :: String -> String
solve (x:y:ys)
  | x == 'T' && y == 'T' = 'P' : 'C' : solve ys
  | y == '.' = x : y : solve ys
  | otherwise = x : solve (y:ys)
solve xs = xs  

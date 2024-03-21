import Data.Bool (bool)

main :: IO ()
main = do
  solve <$> readLn >>= print

solve :: Int -> Int
solve x = f x
  where
    f = bool (flip div 10 . (+ 9)) (flip quot 10) $ x < 0

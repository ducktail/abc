import Control.Monad(guard)
import Text.Printf

main :: IO ()
main = do
  n <- readLn :: IO Int
  let ls = do
        x <- [0..n]
        y <- [0..n]
        guard $ x + y <= n
        z <- [0..n]
        guard $ x + y + z <= n
        return (x, y, z)
  mapM_ (\(x, y, z) -> printf "%d %d %d\n" x y z) ls

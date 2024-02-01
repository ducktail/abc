import Data.List

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = snd . maximumBy g . map f . group . sort
  where
    f l = (length l , [head l])
    g (a, b) (c, d) =
      if a == c then compare d b else compare a c

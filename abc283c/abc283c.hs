import Control.Applicative

main :: IO ()
main = solve <$> getLine >>= print

solve :: String -> Int
solve = f 0
  where
    f c ('0':'0':ss) = f (c + 1) ss
    f c (_:ss) = f (c + 1) ss
    f c [] = c

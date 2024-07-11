{-# LANGUAGE OverloadedStrings #-}
import Data.Bool (bool)

main :: IO ()
main = solve <$> f <*> f >>= putStrLn
  where
    f = map read <$> words <$> getLine

solve :: [Int] -> [Int] -> String
solve [xl0, yl0, zl0, xh0, yh0, zh0] [xl1, yl1, zl1, xh1, yh1, zh1] = 
  bool "Yes" "No" $ (f xl0 xh0 xl1 xh1) * (f yl0 yh0 yl1 yh1) * (f zl0 zh0 zl1 zh1) == 0
  where
    f l0 h0 l1 h1 = max 0 ((min h0 h1) - (max l0 l1))

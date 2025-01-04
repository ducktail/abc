{-# LANGUAGE OverloadedStrings #-}

import Data.Bool (bool)

main :: IO ()
main = do
  [_, c1, c2] <- f
  solve (head c1) (head c2) <$> getLine >>= putStrLn
  where
    f = words <$> getLine

solve :: Char -> Char -> String -> String
solve c1 c2 = map (bool c2 c1 . (== c1))

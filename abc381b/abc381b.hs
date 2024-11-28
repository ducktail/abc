{-# LANGUAGE OverloadedStrings #-}
import Data.Set (Set)
import qualified Data.Set as S

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve s = f S.empty s
  where
    f st (x:y:ys)
      | S.member x st = "No"
      | x == y = f (S.insert x st) ys
      | otherwise = "No"
    f _ [] = "Yes"
    f _ _ = "No"

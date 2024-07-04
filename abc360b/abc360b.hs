{-# LANGUAGE OverloadedStrings #-}
import Data.List (transpose)
import Data.Bool (bool)

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = words <$> getLine

solve :: [String] -> String
solve [s, t] = bool "No" "Yes" $ t `elem` xs
  where
    los = length s
    xs = do
      w <- [1 .. los - 1]
      tp w s

tp :: Int -> String -> [String]
tp w s = transpose $ f s
  where
    f xs =
      let (as, bs) = splitAt w xs in
        if null bs then [as] else as : f bs

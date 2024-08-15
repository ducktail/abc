{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM)
import Data.List (transpose)

main :: IO ()
main = do
  n <- readLn
  solve <$> replicateM n getLine >>= mapM_ putStrLn

solve :: [String] -> [String]
solve ss = map (\s -> reverse $ dropWhile (== '*') s) $ transpose $ map (\s -> take m (s ++ repeat '*')) ss
  where
    m = maximum $ map length ss

{-# LANGUAGE OverloadedStrings #-}
import Text.ParserCombinators.ReadP

main :: IO ()
main = unwords <$> map show <$> solve <$> getLine >>= putStrLn

solve :: String -> [Int]
solve = fst . last . readP_to_S nbars . tail
  where
    nbar = do
      cs <- many1 (char '-')
      return $ length cs
    nbars = sepBy nbar (char '|')

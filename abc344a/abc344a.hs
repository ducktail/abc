import Text.ParserCombinators.ReadP
import Data.Char (isLower)

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = fst . head . readP_to_S spoiler
  where
    spoiler :: ReadP String
    spoiler = do
      a <- munch isLower
      char '|'
      munch isLower
      char '|'
      b <- munch isLower
      return $ a ++ b

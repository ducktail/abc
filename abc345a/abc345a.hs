import Text.ParserCombinators.ReadP

main :: IO ()
main = solve <$> getLine >>= putStrLn
  
solve :: String -> String
solve = f . readP_to_S leftrightarrow
  where
    f x = case x of
      [] -> "No"
      [(_, "")] -> "Yes"
      _ -> "No"
    leftrightarrow :: ReadP ()
    leftrightarrow = do
      char '<'
      many1 (char '=')
      char '>'
      return ()

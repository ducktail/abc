{-# LANGUAGE OverloadedStrings #-}
import Text.ParserCombinators.ReadP

main :: IO ()
main = getLine >> solve <$> getLine >>= putStrLn

solve ::String -> String
solve s = case readP_to_S ot s of
            [] -> "No"
            ls -> case (last ls) of
                    (True, "") -> "Yes"
                    _ -> "No"
  where
    ot = do
      os <- many (char '1')
      char '/'
      ts <- many (char '2')
      return $ length os == length ts

import Control.Applicative
import Data.List

main :: IO ()
main = solve <$> getLine >>= putStrLn

solve :: String -> String
solve = maybe "No" (const "Yes") . flip find ls . (==)
  where
    ls = ["ACE", "BDF", "CEG", "DFA", "EGB", "FAC", "GBD"]

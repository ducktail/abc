import Data.List (isPrefixOf, isSuffixOf)

main :: IO ()
main = getLine >> solve <$> getLine <*> getLine >>= print

solve :: String -> String -> Int
solve s t = case (s `isPrefixOf` t, s `isSuffixOf` t) of
              (True, True) -> 0
              (True, False) -> 1
              (False, True) -> 2
              (False, False) -> 3

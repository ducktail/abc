{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = solve <$> f >>= putStrLn
  where
    f = words <$> getLine

solve :: [String] -> String
solve [sab, sac, sbc]
  | sab /= sac = "A"
  | sac == sbc = "B"
  | otherwise = "C"

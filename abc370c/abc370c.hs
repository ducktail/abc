{-# LANGUAGE OverloadedStrings #-}

main :: IO ()
main = do
  l <- solve <$> getLine <*> getLine
  print $ length l
  mapM_ putStrLn l

solve :: String -> String -> [String]
solve s t = f s []
  where
    f x l =
      if x == t then reverse l
      else let y = g x
           in f y (y : l)
    g x =
      minimum $ foldl (\u i ->
                          let (x0, x1) = splitAt i x
                              (t0, t1) = splitAt i t
                          in if head x1 == head t1 then u
                             else (x0 ++ (head t1) : tail x1) : u
                      ) [] [0 .. (length x - 1)]

import Control.Monad(foldM_)

main :: IO ()
main = do
  q <- readLn
  foldM_ (\s _ -> do
            [c, x] <- f
            if c == 1 then return (x:s)
              else do
              print $ head $ drop (x - 1) s
              return s
         ) [] [1..q]
  where
    f = map read <$> words <$> getLine

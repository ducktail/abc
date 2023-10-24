main :: IO ()
main = (++ " san") <$> head <$> words <$> getLine >>= putStrLn

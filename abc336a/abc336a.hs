main :: IO ()
main = solve <$> readLn >>= putStrLn

solve :: Int -> String
solve = ('L' :) . (++ "ng") . flip replicate 'o'

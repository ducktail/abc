{-# LANGUAGE OverloadedStrings #-}
import Control.Monad (replicateM, foldM)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Text.Read (Reader)
import qualified Data.Text.Read as T
import Data.Vector.Unboxed.Mutable (IOVector)
import qualified Data.Vector.Unboxed.Mutable as VM

main :: IO ()
main = do
  n <- readLn
  qs <- replicateM n f
  solve qs
  where
    f = map (readtx T.decimal) <$> T.words <$> T.getLine

solve :: [[Int]] -> IO ()
solve qs = do
  vk <- VM.replicate 1000001 0 :: IO (IOVector Int)
  foldM (\ct q -> do
            case q of
              [1, x] -> do
                y <- VM.read vk x
                if y == 0 then do
                  VM.write vk x 1
                  return (ct + 1)
                else do
                  VM.write vk x (y + 1)
                  return ct
              [2, x] -> do
                y <- VM.read vk x
                if y == 1 then do
                  VM.write vk x 0
                  return (ct - 1)
                else do
                  VM.write vk x (y - 1)
                  return ct
              _ -> do
                print ct
                return ct
        ) 0 qs
  return ()

readtx :: Num a => Reader a -> Text -> a
readtx f = either (const 0) fst . f

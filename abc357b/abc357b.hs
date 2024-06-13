import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import qualified Data.Text.Read as T
import Data.Char (isUpper)

main :: IO ()
main = solve <$> T.getLine >>= T.putStrLn

solve :: Text -> Text
solve t = if ct * 2 > l then T.toUpper t else T.toLower t
  where
    l = T.length t
    ct = T.length $ T.filter isUpper t

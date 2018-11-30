import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util


main :: IO ()
main = shakeArgs shakeOptions{shakeFiles="_build"} $ do
    -- I've also tried shakeFiles="_shake"; same result
  want ["_build/test.txt"]

  "_build/test.txt" %> \_ -> do
    cmd_ "echo testing" ">> _build/test.txt"

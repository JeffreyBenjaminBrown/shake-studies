import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util


main :: IO ()
main = shakeArgs shakeOptions{shakeFiles="_build"} $ do
  want ["_build/test.txt"]

  "_build/test.txt" %> \_ ->
    cmd "echo testing"
    >>= \(Stdout x) -> writeFile' "_build/test.txt" x

  phony "mumble" $ do
    putNormal "mumbling"
    liftIO $ putStrLn "mumbling differently"

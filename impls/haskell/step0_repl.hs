import System.IO (hFlush, stdout)
import System.IO.Error (isEOFError)
import Control.Exception (catch)

exitMsg :: String
exitMsg = "exit"

eofHandler :: IOError -> IO String
eofHandler e
  | isEOFError e = pure exitMsg
  | otherwise = ioError e

prompt :: String -> IO String
prompt text = putStr text *> hFlush stdout *> catch getLine eofHandler

eval :: String -> String
eval = id

main :: IO ()
main = do
  input <- prompt "user> "
  if input == exitMsg then
    pure ()
  else do
    let res = eval input
    putStrLn res
    main


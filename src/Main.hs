module Main where

import Data.ByteString as Bytes
import Data.List as List
import Data.ByteString.Char8 as CharBytes
import Flow


main :: IO ()
main = do
  askForFileName
  fileName <- getFileName
  content <- getProject fileName
  printFirstLine fileName content

-- Take the file text, seperate it into lines
-- and then print the first line
printFirstLine :: String -> Bytes.ByteString -> IO ()
printFirstLine fileName lines = 
  lines
  |>seperateLines
  |>List.head
  |>CharBytes.putStrLn

-- Take the text, and seperate it into lines
-- by seperating them on the '\n' character
seperateLines :: Bytes.ByteString -> [ Bytes.ByteString ]
seperateLines =
  CharBytes.split '\n'

-- Prompt the user to enter in a file name
askForFileName :: IO ()
askForFileName =
  Prelude.putStrLn "Enter Files name : "

-- Get the file name the user entered
getFileName :: IO String
getFileName =
  Prelude.getLine

-- Given the file name, return its data
getProject :: String -> IO Bytes.ByteString
getProject = 
  Bytes.readFile





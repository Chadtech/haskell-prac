module Main where

import Yeah
import Data.ByteString as Bytes
import Data.List as List
import Data.ByteString.Char8 as CharBytes


main :: IO ()
main = do
  content <- getProject
  printFirst (CharBytes.split '\n' content)

printFirst :: [ Bytes.ByteString ] -> IO ()
printFirst parts = 
  CharBytes.putStrLn (List.last parts)

getProject :: IO Bytes.ByteString
getProject = 
  Bytes.readFile "./project.project"




myData :: Bytes.ByteString
myData =
  Bytes.concat 
  [ CharBytes.pack "WOWO COOLO" 
  , Bytes.pack [0, 1, 2, 3, 4, 4 ]
  ]

  -- Bytes.writeFile 
  --   "./fileo.txt"
    -- getProject

-- main = do  
--         contents <- readFile "test.txt"
--         print . map readInt . words $ contents
module Screens.SearchBook where

import Controllers.Book
import Data.Char (digitToInt)
import DataTypes.Api
import qualified DataTypes.Application
import Utils.Api
import Utils.Screen
import Controllers.Profile

searchBookDisplay :: String -> Int -> IO String
searchBookDisplay bookTitle page = do
  clearScreen
  putStrLn "\n=-=-=-=-=-=-=-=-=-=\nLoading...\n=-=-=-=-=-=-=-=-=-=\n"
  books <- searchBook bookTitle page
  clearScreen

  putStrLn "\n=-=-=-=-=-=-=-=-=-=\nSearch Results\n=-=-=-=-=-=-=-=-=-=\n"
  if length books == 0
    then putOnScreen "Book not found! (Press ENTER to back)" 
    else do printBookApis books 1
            line <-
              putOnScreen
                "\n\n=-=-=-=-=-=-=-=-=-=\n\
                \Enter the option number (1...5) \n\
                \or 'c' to cancel\n\
                \or 'n' to see next page\n\
                \or 'p' to see previous page\n\
                \Your choice:"

            searchBookOptions books bookTitle page line

searchBookOptions :: [BookApi] -> String -> Int -> String -> IO String
searchBookOptions books bookTitle page option
  | option == "c" = return ""
  | option == "n" = searchBookDisplay bookTitle (page + 1)
  | option == "p" = searchBookDisplay bookTitle (page - 1)
  | elem (read option :: Int) [1..5] = do
    let optionNumber = read option :: Int
    enterDetailsDisplay $ books !! (optionNumber - 1)
  | otherwise = do 
    putOnScreen "Option Invalid. (Press ENTER to continue)"
    searchBookDisplay bookTitle page

printBookApis :: [BookApi] -> Int -> IO ()
printBookApis [] index = return ()
printBookApis (current : rest) index = do
  putStrLn $ getBookApiString current index
  printBookApis rest (index + 1)

getBookApiString :: BookApi -> Int -> String
getBookApiString book index =
  "\n---------------------\n"
    ++ "-- Option "
    ++ show index
    ++ "\n"
    ++ show book

enterDetailsDisplay :: BookApi -> IO String
enterDetailsDisplay bookApi = do
  rate <- putOnScreen "Enter a rate for the book: "
  description <- putOnScreen "Enter a description for the book: "

  createBook
    ( DataTypes.Application.Book
        (title bookApi)
        (subject bookApi)
        (author_name bookApi)
        (read rate :: Int)
        description
    )

  updateGoal
  putOnScreen "Your book has been successfully added! (Press ENTER to continue)"
  return ""

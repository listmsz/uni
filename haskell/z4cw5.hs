import Data.List
import System.IO 

guess = do
    let x = 42
    putStr "Zgadnij liczbę z przediału 0 do 100: "
    n <- getLine
    let y = read n
    if y < x
      then do putStrLn "za mało!"
              guess
      else if y > x
             then do putStrLn "za duzo!"
                     guess
             else putStrLn "wygrana!"
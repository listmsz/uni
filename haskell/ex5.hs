import Data.List
import System.IO 

--Zadanie 1
prompt = do 
    putStrLn "Podaj pierwsza liczbę"
    n <- getLine
    let x = read n
    putStrLn "Podaj druga liczbę"
    l <- getLine
    let y = read l
    putStrLn("suma: " ++ (show (y + x)))
    putStrLn("iloczyn: " ++ (show (y * x)))
    putStrLn("roznica: " ++ (show (y - x)))

--Zadanie 2
pNWD = do 
    putStrLn "Podaj pierwsza liczbę"
    n <- getLine
    let x = read n
    putStrLn "Podaj druga liczbę"
    l <- getLine
    let y = read l
    putStrLn("NWD: " ++ (show (gcd y x)))
    putStrLn("NWW: " ++ (show (lcm x y)))


--Zadanie 3
inicialy = do 
    putStrLn "Podaj imię"
    i <- getLine
    putStrLn "Podaj nazwisko"
    n <- getLine
    putStrLn("Inicjaly: " ++ (show (head i)) ++ (show (head n)))

--Zadanie 4
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
import Data.List

--Zadanie 1
squareElems l = map (\x -> x^2) l --squareElems [1,2,3] = [1,4,9]
countOccurences a l = length $ filter (\x -> x == a) l -- countOccurences 1 [1,3,4,2,43,1,436,1] = 3
sumElems l = foldr (\x y -> x+y) 0 l

--Zadanie 2
data Moto = Saab 
            | Mercedes
            | Lotus
            | Jeep
            | Mazda
            deriving (Show)
type Kraj = [Char]

-- a
getCarMarkByCountry :: Kraj -> Moto
getCarMarkByCountry a   | a == "Sweden" = Saab
                        | a == "Germany" = Mercedes
                        | a == "UK" = Lotus
                        | a == "USA" = Jeep
                        | a == "Japan" = Mazda

-- b
getCarAvgSpeed :: Moto -> Int
getCarAvgSpeed a = case a of
                        Saab -> 240
                        Mercedes -> 220
                        Lotus -> 340
                        Jeep -> 180
                        Mazda -> 160

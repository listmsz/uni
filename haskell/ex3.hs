import Data.List
import System.IO 

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
getCarAvgSpeed a = case a of Saab -> 240
                             Mercedes -> 220
                             Lotus -> 340
                             Jeep -> 180
                             Mazda -> 160

--Zadanie 3
--a
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)
t :: Tree Int
t =   
    Node 1  
        (Node 2  
            (Node 4 Empty Empty)  
            (Node 5 Empty (Node 8 Empty Empty)) 
        )  
        (Node 3  
            (Node 6 Empty (Node 9 Empty Empty))
            (Node 7 Empty Empty)
        )

--b
tCh :: Tree Char
tCh =   
    Node 'a' 
        (Node 'b'  
            Empty
            (Node 'd' (Node 'f' Empty Empty) Empty) 
        )  
        (Node 'c' 
            (Node 'e' Empty (Node 'g' Empty Empty))
            Empty
        )

preorder:: Tree a -> [a]
preorder Empty = []
preorder (Node a l r) = [a] ++ preorder l ++ preorder r

-- *Main> preorder t
-- [1,2,4,5,8,3,6,9,7]
-- *Main> preorder tCh
-- "abdfceg"

inorder:: Tree a -> [a]
inorder Empty = []
inorder (Node a l r) = inorder l ++ [a] ++ inorder r

-- *Main> inorder t
-- [4,2,5,8,1,6,9,3,7]
-- *Main> inorder tCh
-- "bfdaegc"

postorder:: Tree a -> [a]
postorder Empty = []
postorder (Node a l r) = postorder l ++ postorder r ++ [a]

-- *Main> postorder t
-- [4,8,5,2,9,6,7,3,1]
-- *Main> postorder tCh
-- "fdbgeca"


--Zadanie 4
--a 
treeMember a t = elem a (inorder t)
--b
treeMemberWithoutUsingElem e Empty = False
treeMemberWithoutUsingElem e (Node a l r) = a == e || treeMemberWithoutUsingElem e l || treeMemberWithoutUsingElem e l

--Zadanie 5
--a 
longestPathLength Empty = 0 
longestPathLength (Node a Empty Empty) = 0 
longestPathLength (Node a l r) = max (longestPathLength(l) + 1) (longestPathLength(r) + 1)

-- b
shortestPathLength Empty = 0
shortestPathLength (Node a Empty Empty) = 0
shortestPathLength (Node a l Empty) = shortestPathLength(l) + 1
shortestPathLength (Node a Empty r) = shortestPathLength(r) + 1
shortestPathLength (Node a l r) = 1 + min (shortestPathLength(l)) (shortestPathLength(r))

--Zadanie 6
pickNodesToPrint (Node _ Empty Empty) = []
pickNodesToPrint (Node _ Empty b)     = [b]
pickNodesToPrint (Node _ a Empty)     = [a]
pickNodesToPrint (Node _ a b)         = [a,b]

poziomo :: Tree a -> [a]
poziomo tree = t [tree]
    where
        t [] = []
        t xs = map (\(Node a _ _) -> a) xs ++ t (concat (map pickNodesToPrint xs)) 
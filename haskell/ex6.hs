import Data.List
import System.IO 

--Zadanie 1
--a)
one 1 = 0
one 2 = 5
one n = one(n-1) + 2 * one(n - 2)

--b) TODO
oneB 1 = 0
oneB 2 = 5
oneB n = n --TODO

--Zadanie 2
--Napisać definicję funkcji, która w liście przestawia
 --a) pierwszy element z drugim, 
swapTwoFirst x = (reverse (fst (splitAt 2 x))) ++ snd (splitAt 2 x) 
 --b) pierwszy element z ostatnim, 
swapFirstAndLast x = [last x] ++ (drop 1 $ take ((length x) - 2)  x) ++ [x!!0]
 --c) drugi element z przedostatnim.
swapSecondTos x = [x!!0, x!!((length x)-2)] ++ (drop 2 $ take ((length x) - 4)  x) ++ [x!!1, last x]

--Zadanie 3
countElem a x = length $ filter (a==) x

--Zadanie 4
twoListsAreEqual x y = (length x == length y) && (foldr (&&) True (zipWith (==) x y))

--Zadanie 5
twoListsHaveSameElems x y = length x == length y && (length $ filter (`elem` y) x) == length x

--Zadanie 6 --TODO
-- sort x y = 


--Zadanie 7
-- data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

-- getNodeValue (Node a l r) = a
-- getLeftNode (Node a l r) = l
-- getRightNode (Node a l r) = r

-- t =   
--     Node 1  
--         (Node 2  
--             (Node 4 Empty Empty)  
--             (Node 5 Empty (Node 8 Empty Empty)) 
--         )  
--         (Node 3  
--             (Node 6 Empty (Node 9 Empty Empty))
--             (Node 7 Empty Empty)
--         )

-- wat Empty Empty = True
-- wat t1 Empty = False
-- wat Empty t2 = False
-- wat t1 t2 = (getNodeValue(t1) == getNodeValue(t2)) && (wat getLeftNode(t1) getLeftNode(t2)) && areTreeEqual(getRightNode(t1), getRightNode(t2))




-- isSubtree Empty Empty = True
-- isSubtree Empty t2 = True
-- isSubtree t1 Empty = False
-- isSubtree t1 t2 = areTreeEqual(t1, t2) || isSubtree(t1, getLeftNode(t2)) || isSubtree(t1, getRightNode(t2))


--Zadanie 8
countElementInList x y = length $ filter (y==) x
listToNumberOfElements x = zip (nub x) (map (\a -> countElementInList x a) (nub x))

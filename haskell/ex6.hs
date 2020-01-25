import Data.List
import System.IO 

--Zadanie 1
--a)
one 1 = 0
one 2 = 5
one n = one(n-1) + 2 * one(n - 2)

--b)
oneB 1 = 0
oneB 2 = 5
oneB n = oneBInternal n 5 0

oneBInternal n f1 f2  | n==2 = f1
                      | otherwise = oneBInternal (n-1) (f1 + 2*f2) f1

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

--Zadanie 6
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) | x <= y    = x:merge xs (y:ys)
                    | otherwise = y:merge (x:xs) ys


--Zadanie 7 -–TODO
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)
getNodeValue::Tree a ->  a
getNodeValue (Node a l r) = a
getLeftNode::Tree a -> Tree a
getLeftNode (Node a l r) = l
getRightNode::Tree a -> Tree a
getRightNode (Node a l r) = r

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
areTreeEqual:: Eq a => Tree a -> Tree a -> Bool
areTreeEqual Empty Empty = True
areTreeEqual t1 Empty = False
areTreeEqual Empty t2 = False
areTreeEqual t1 t2 = (getNodeValue(t1) == getNodeValue(t2))
-- areTreeEqual t1 t2 = (getNodeValue(t1) == getNodeValue(t2)) && areTreeEqual(getLeftNode t1, getLeftNode t2) && areTreeEqual(getRightNode t1, getRightNode t2)


isSubtree:: Eq a => Tree a -> Tree a -> Bool
isSubtree Empty Empty = True
isSubtree Empty t2 = True
isSubtree t1 Empty = False
--isSubtree t1 t2 = areTreeEqual(t1, t2) || isSubtree(t1, getLeftNode(t2)) || isSubtree(t1, getRightNode(t2))


--Zadanie 8
countElementInList x y = length $ filter (y==) x
listToNumberOfElements x = zip (nub x) (map (\a -> countElementInList x a) (nub x))

--Zadanie 9
compareDstFn (a,b) (c,d) | sqrt (a^2 + b^2) > sqrt (c^2 + d^2) = GT
                         | otherwise = LT

orderByDistanceFromOX x = sortBy compareDstFn x

--Zadanie 10
bsort s = case innerBSort s of
               t | t == s    -> t
                 | otherwise -> bsort t
  where innerBSort (x:x2:xs) | x > x2    = x2:(innerBSort (x:xs))
                             | otherwise = x:(innerBSort (x2:xs))
        innerBSort s = s
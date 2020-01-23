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
twoListsAreEqual x y = length x == length y && zipWith (==) x y

--Zadanie 5
twoListsHaveSameElems x y = length x == length y && filter (`elem` y) x

--Zadanie 6
-- sort x y = 
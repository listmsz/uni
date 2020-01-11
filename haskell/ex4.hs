import Data.List

--Zadanie 1
-- module A
-- where
--     import Data.List
    podzbior _ [] = True
    podzbior [] _ = True
    podzbior xs ys = all (`elem` ys) xs
    iloczyn [] _ = []
    iloczyn _ [] = []
    iloczyn x y = filter (`elem` y) x 
    suma x y = nub (x ++ y)
    roznica x y = filter ((`notElem` y))x 

--Zadanie 3
countElementInList x y = length $ filter (y==) x
listToNumberOfElements x = zip (nub x) (map (\a -> countElementInList x a) (nub x))

--Zadanie 4
zipFn [] _ = []
zipFn _ [] = []
zipFn (x:xs) (y:ys) = (x,y):zipFn xs ys

unzipFn [] = ([], [])
unzipFn xs = (map fst xs, map snd xs)


{-
--Zadanie 5
foldr (/) 2 [6, 12, 24, 8]
3.0
==> 6 / (foldr (/) 2 [12, 24, 8]
==> 6 / (12 / foldr (/) 2 [24, 8])
==> 6 / (12 / (24 / foldr (/) 2 [8]))
==> 6 / (12 / 24 / (8 / foldr (/) 2 []))
==> 6 / (12 / (24 / (8 / 2)))
==> 6 / (12 / (24 / 4))
==> 6 / (12 / 6)
==> 6 / 2
==> 3

foldr (&&) True [1>2, 3>2, 5==5]
False
==> 1>2 && (foldr (&&) True [3>2, 5==5])
==> 1>2 && (3>2 && foldr (&&) True [5==5])
==> 1>2 && (3>2 && (5==5 && foldr (&&) True []))
==> 1>2 && (3>2 && (5==5 && True))
==> 1>2 && (3>2 && True)
==> 1>2 && True
==> False

foldr max 18 [3, 6, 12, 4, 55, 11]
55
==> 3 max (foldr max 18 [6, 12, 4, 55, 11])
==> 3 max (6 max (foldr max 18 [12, 4, 55, 11]))
==> 3 max (6 max (12 max (foldr max 18 [4, 55, 11])))
==> 3 max (6 max (12 max (4 max (foldr max 18 [55, 11]))))
==> 3 max (6 max (12 max (4 max (55 max (foldr max 18 [11])))))
==> 3 max (6 max (12 max (4 max (55 max (11 max foldr 18 [])))))
==> 3 max (6 max (12 max (4 max (55 max (11 max 18)))))
==> 3 max (6 max (12 max (4 max (55 max 18))))
==> 3 max (6 max (12 max (4 max 55)))
==> 3 max (6 max (12 max 55))
==> 3 max (6 max 55)
==> 3 max 55
==> 55

foldr max 81 [3, 6, 12, 4, 55, 11]
81
==> 3 max (foldr max 81 [6, 12, 4, 55, 11])
==> 3 max (6 max (foldr max 81 [12, 4, 55, 11]))
==> 3 max (6 max (12 max (foldr max 81 [4, 55, 11])))
==> 3 max (6 max (12 max (4 max (foldr max 81 [55, 11]))))
==> 3 max (6 max (12 max (4 max (55 max (foldr max 81 [11])))))
==> 3 max (6 max (12 max (4 max (55 max (11 max (foldr max 81 []))))))
==> 3 max (6 max (12 max (4 max (55 max (11 max 81)))))
==> 3 max (6 max (12 max (4 max (55 max 81))))
==> 3 max (6 max (12 max (4 max 81)))
==> 3 max (6 max (12 max 81))
==> 3 max (6 max 81)
==> 3 max 81
==> 81

foldr (\x y -> (x+y)/2) 54 [24, 4, 10, 6]
==> 24 (\x y -> (x+y)/2) (foldr (\x y -> (x+y)/2) 54 [4, 10, 6])
==> 24 (\x y -> (x+y)/2) (4 (\x y -> (x+y)/2) (foldr (\x y -> (x+y)/2) 54 [10, 6]))
==> 24 (\x y -> (x+y)/2) (4 (\x y -> (x+y)/2) (10 (\x y -> (x+y)/2) (foldr (\x y -> (x+y)/2) 54 [6])))
==> 24 (\x y -> (x+y)/2) (4 (\x y -> (x+y)/2) (10 (\x y -> (x+y)/2) (6 (\x y -> (x+y)/2) (foldr (\x y -> (x+y)/2) 54 []))))
==> 24 (\x y -> (x+y)/2) (4 (\x y -> (x+y)/2) (10 (\x y -> (x+y)/2) (30)
==> 24 (\x y -> (x+y)/2) (4 (\x y -> (x+y)/2) (20)
==> 24 (\x y -> (x+y)/2) (12)
==> 18

foldl (\x y -> (x+y)/2) 54 [2, 4, 10, 6]
==> foldl (\x y -> (x+y)/2) (54 (\x y -> (x+y)/2) 2) [4, 10, 6]
==> foldl (\x y -> (x+y)/2) ((54 (\x y -> (x+y)/2) 2) (\x y -> (x+y)/2) 4) [10, 6]
==> foldl (\x y -> (x+y)/2) (((54 (\x y -> (x+y)/2) 2) (\x y -> (x+y)/2) 4) (\x y -> (x+y)/2) 10) [6]
==> foldl (\x y -> (x+y)/2) ((((54 (\x y -> (x+y)/2) 2) (\x y -> (x+y)/2) 4) (\x y -> (x+y)/2) 10) (\x y -> (x+y)/2) 6) []
==> (( 28 (\x y -> (x+y)/2) 4) (\x y -> (x+y)/2) 10) (\x y -> (x+y)/2) 6
==> (16 (\x y -> (x+y)/2) 10) (\x y -> (x+y)/2) 6
==> 13 (\x y -> (x+y)/2) 6
==> 9.5

foldl (/) 64 [4, 2, 4]
==> foldl (/) (64 / 4) [2, 4]
==> foldl (/) ((64 / 4) / 2) [4]
==> foldl (/) (((64 / 4) /2) /4) []
==> ((16) / 2) / 4
==> 8 / 4
==> 2

foldl (\x y -> 2*x + y) 8 [1, 2, 3]
==> foldl (\x y -> 2*x + y) (8 (\x y -> 2*x + y) 1) [2, 3]
==> foldl (\x y -> 2*x + y) ((8 (\x y -> 2*x + y) 1) (\x y -> 2*x + y) 2) [3]
==> foldl (\x y -> 2*x + y) (((8 (\x y -> 2*x + y) 1) (\x y -> 2*x + y) 2) (\x y -> 2*x + y) 3) []
==> ((17 (\x y -> 2*x + y) 2) (\x y -> 2*x + y) 3)
==> (36 (\x y -> 2*x + y) 3)
==> 75
--}
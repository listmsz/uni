import Data.List

--Zadanie 1
reverseList::[a]->[a]
reverseList []=[]
reverseList (x:xs)= reverseList(xs)++[x]

--Zadanie 2
swapFirstAndLast::[a]->[a]
swapFirstAndLast []=[]
swapFirstAndLast (x:xs)= last (xs):((init xs)++[x])

--Zadanie 3
--a)
numberOfEvenElements::[Int]->Int
numberOfEvenElements x = length (filter even x)

--b)
divisibleByThree::Int->Int
divisibleByThree n | n<3=0
                   | otherwise =length([0,3..n])-1 


--c)
sumDivisibleByThree::Int->Int
sumDivisibleByThree n| n<3=0
                     | otherwise =sum([0,3..n])

--Zadanie 4
isLengthEven:: [x] -> Bool
isLengthEven x = even (length x)

--Zadanie 5
--a)
sqrListMap::Num a=>[a]->[a]
sqrListMap []=[]
sqrListMap (x:xs)=map (^2) (x:xs)

--b)
sqrList::Num a=>[a]->[a]
sqrList []=[]
sqrList (x:xs)=[x^2]++sqrList xs

--Zadanie 6
countElementInList :: Eq a => a -> [a] -> Int
countElementInList x []=0
countElementInList x y = length $ filter (x==) y

--Zadanie 7
duplicate::(a,Int)->[a]
duplicate (_,0)=[]
duplicate (a,n)=[a]++duplicate (a,n-1)

--Zadanie 8
isPalindrome::Eq a=>[a]->Bool
isPalindrome []=True
isPalindrome xs| xs==(reverse xs)=True|otherwise=False

--Zadanie 9
removeFirstOccurence::Eq a=>a->[a]->[a]
removeFirstOccurence _ []=[]
removeFirstOccurence a (x:xs) | a==x =xs
                              | otherwise =x:(removeFirstOccurence a xs)

--Zadanie 10
removeElement:: Int->[a]->[a]
removeElement _ []=[]
removeElement 0 (x:xs)=xs
removeElement n (x:xs)=x:(removeElement (n-1) xs)

--Zadanie 11
compareTwoLists::Eq a=>[a]->[a]->Bool
compareTwoLists [x] (y:ys) | elem x (y:ys) =True
                           | otherwise =False
compareTwoLists (x:xs) (y:ys) | elem x (y:ys)=compareTwoLists xs (y:ys)
                              | otherwise=False

--Zadanie 12
revertTuples::[(a,b)]->[(b,a)]
revertTuples []=[]
revertTuples ((a,b):xs)=(b,a):(revertTuples xs)
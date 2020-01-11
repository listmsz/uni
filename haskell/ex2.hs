import Data.List

--Zadanie 1
revertList::[a]->[a]
revertList []=[]
revertList (x:xs)= revertList(xs)++[x]

--Zadanie 2
swapFirstLast::[a]->[a]
swapFirstLast []=[]
swapFirstLast (x:xs)= last (xs):((init xs)++[x])

--Zadanie 3
--a)
noEvenElements::[Integer]->Integer
noEvenElements []=0
noEvenElements (x:xs)|(x mod 2)==0=1+noEvenElements xs|otherwise=noEvenElements xs

--b)
divisibleByThree::Int->Int
divisibleByThree n|n<3=0
divisibleByThree n=length([0,3..n])-1 


--c)
sumDivisibleByThree::Int->Int
sumDivisibleByThree n|n<3=0
sumDivisibleByThree n=sum([0,3..n])

--Zadanie 4
isElementNoEven (x:xs)|length (x:xs) mod 2==0=True|otherwise=False

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
countObject::Eq a=>a->[a]->Integer
countObject a []=0
countObject a (x:xs)| a==x=1+countObject a xs|otherwise=countObject a xs

--Zadanie 7
duplicate::(a,Int)->[a]
duplicate (_,0)=[]
duplicate (a,n)=[a]++duplicate (a,n-1)

--Zadanie 8
isPalindrome::Eq a=>[a]->Bool
isPalindrome []=True
isPalindrome xs| xs==(reverse xs)=True|otherwise=False

--Zadanie 9
removeFirst::Eq a=>a->[a]->[a]
removeFirst _ []=[]
removeFirst a (x:xs)|a==x=xs|otherwise=x:(removeFirst a xs)

--Zadanie 10
removeElement:: Int->[a]->[a]
removeElement _ []=[]
removeElement 0 (x:xs)=xs
removeElement n (x:xs)=x:(removeElement (n-1) xs)

--Zadanie 11
compareTwoLists::Eq a=>[a]->[a]->Bool
compareTwoLists [x] (y:ys)|elem x (y:ys)=True|otherwise=False
compareTwoLists (x:xs) (y:ys)| elem x (y:ys)=compareTwoLists xs (y:ys)|otherwise=False

--Zadanie 12
revertTuples::[(a,b)]->[(b,a)]
revertTuples []=[]
revertTuples ((a,b):xs)=(b,a):(revertTuples xs)
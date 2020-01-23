import Data.List

{-
--Zadanie 1
2489*981 --2441709
:t 2489*981 --2489*981 :: Num a => a
(+) 245 900 -- 1145
315^10 -- 9618459881658113759765625
:t 315^10 -- 315^10 :: Num a => a
(^) 315 10-- 9618459881658113759765625
round 5.4 --5
:t round(5.4) --:t round(5.4)
succ 6 --7
:t succ 6 --succ 6 :: (Enum a, Num a) => a
truncate pi --3
:t truncate pi --truncate pi :: Integral b => b
compare (sqrt 3) (sqrt 6) --LT
:t compare (sqrt 3) (sqrt 6) --compare (sqrt 3) (sqrt 6) :: Ordering
(compare 4 5) = = EQ --False
:type (True,"pf") -- (True,"pf") :: (Bool, [Char])
:type (||) --(||) :: Bool -> Bool -> Bool
null "abcd" --False
:t null --null :: Foldable t => t a -> Bool
:t null "abcd" --null "abcd" :: Bool
fst(1,'a') --1
fst('a',1) --'a'
:t fst(1,'a') --fst(1,'a') :: Num a => a
:t fst('a',1) --fst('a',1) :: Char
:type fst --fst :: (a, b) -> a
let liczby = [3,4,5]
2:liczby -- [2,3,4,5]
0:1:2:liczby "OLA" -- error
'O':'L':'A' --error
"Ala"++"i"++"Ola" --"AlaiOla"
:type "Ala"++"i"++"Ola" --"Ala"++"i"++"Ola" :: [Char]
:t sin --sin :: Floating a => a -> a
:t pi --pi :: Floating a => a
:t (&&) --(&&) :: Bool -> Bool -> Bool
True && False --False
:t True && False --True && False :: Bool
 -}

--Zadanie 2
--a)
f(x)|x>2=x*x
    |x<=2 && x>0 = x-1
    |x<=0 = -x

--b) 
nwd::Integral a => a -> a -> a
nwd a  b | b == 0      = a
         | otherwise   = (nwd b (a `mod` b))

--c)
nww a b = fromInteger(a * b) / fromInteger(nwd a b)

--d)
canConstructATriangle x y z | x==y && y==z=True
                            | maximum[x,y,z]==x && x<y+z=True
                            | maximum[x,y,z]==y && y<x+z=True
                            | maximum[x,y,z]==z && z<x+y=True
                            | otherwise=False

--e)
coneVol r h=1/3*pi*r^2*h
--f)
coneGen r h= sqrt sum where sum=r^2+h^2

--g)
power::Float->Integer->Float
power a n|n==0 = 1 |n>0 = a*power a (n-1)|n<0 =1/(power a (-n))

--i) 
fibo x|x==0=0|x==1=1|otherwise=fibo(x-2)+fibo(x-1)

checkFiboElement number elementInFibo|number<0 || elementInFibo<0= False|number==fibo elementInFibo = True|otherwise=False

checkFibo10 number| number<0=False|number==fibo 10=True|otherwise=False

--j)
generateFiboList n=[fibo x | x<-[0..n]]

checkFiboElementRange number| number>100 || number<5=error"Argument out of range <5,100>"|elem number (generateFiboList(15))=True|otherwise=False

--Zadanie 3
--a) 
addToBeginningOfList::a->[a]->[a]
addToBeginningOfList a [] = a:[]
addToBeginningOfList a (x:xs)=a:(x:xs)

--b)
addAsSecond::a->[a]->[a]
addAsSecond a [] = a:[]
addAsSecond a (x:xs)=x:(a:xs)


--c)
addAtTheEnd::[a]->[a]->[a]
addAtTheEnd a [] = []++a
addAtTheEnd a (x:xs)=(x:xs)++a

 --Zadanie 4
 --a)
returnSecond::[a]->a
returnSecond xs|length xs <2 = error"List should contain at least two elements"
               |otherwise=xs!!1

 
 --b)
returnThird::[a]->a
returnThird xs| length xs <3 =error"List should contain at least three elements"
              | otherwise=xs!!2
 
 --c)
returnNextToLast::[a]->a
returnNextToLast xs| length xs <2 =error"List should contain at least two elements"
                   | otherwise=xs!!((length xs)-2)
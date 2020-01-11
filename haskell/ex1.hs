import Data.List

{-
--Zadanie 1
2489*981
:t 2489*981
(+) 245 900
315^10
:t 315^10
(^) 315 10
round 5.4
:t round(5.4)
succ 6
:t succ 6
truncate pi
:t truncate pi
compare (sqrt 3) (sqrt 6)
:t compare (sqrt 3) (sqrt 6)
(compare 4 5) = = EQ
:type (True,"pf")
:type (||)
null “abcd"
:t null
:t null “abcd"
fst(1,’a’)
fst(‘a’,1)
:t fst(1,’a’)
:t fst(‘a’,1)
:type fst
let liczby =[3,4,5]
2:liczby
0:1:2:liczby "OLA"
‘O’:’L’:’A’
“Ala"++"i"++"Ola"
:type “Ala"++"i"++"Ola"
:t sin
:t pi
:t (&&)
True && False
:t True && False
 -}

--Zadanie 2
--a)
f(x)|x>2=x*x
    |x<=2 && x>0 = x-1
    |x<=0 = -x
	
--b) 
nwd a b|b==0=a|otherwise=nwd b (a mod b)

--c)

nww a b = fromInteger(a*b)/fromInteger(nwd a b)

--d)
isTrianglePossible x y z|x==y && y==z=False| maximum[x,y,z]==x && x<y+z=True|maximum[x,y,z]==y && y<x+z=True|maximum[x,y,z]==z && z<x+y=True|otherwise=False

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
addBeg::a->[a]->[a]
addBeg a [] = a:[]
addBeg a (x:xs)=a:(x:xs)

--b)
addAsSecond::a->[a]->[a]
addAsSecond a [] = a:[]
addAsSecond a (x:xs)=x:(a:xs)


--c)
addEnd::[a]->[a]->[a]
addEnd a [] = []++a
addEnd a (x:xs)=(x:xs)++a

 --Zadanie 4
 --a)
returnSecond::[a]->a
returnSecond xs|length xs <2 =error"List should contain at least two elements"|otherwise=xs!!1

 
 --b)
returnThird::[a]->a
returnThird xs| length xs <3 =error"List should contain at least three elements"|otherwise=xs!!2
 
 --c)
returnNextToLast::[a]->a
returnNextToLast xs|length xs <2 =error"List should contain at least two elements"|otherwise=xs!!((length xs)-2)
import Data.List
import System.IO 

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

f Empty = False 
f (Node a Empty Empty) = False 
f (Node a l r) = lt a l && gt a r
                where gt v (Node a l r) = a > v && gt v l && gt v r
                      gt v Empty = True
                      lt v (Node a l r) = a < v && lt v l && lt v r
                      lt v Empty = True
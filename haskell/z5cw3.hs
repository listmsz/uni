import Data.List
import System.IO 
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)
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
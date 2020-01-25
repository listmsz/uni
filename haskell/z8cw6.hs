import Data.List

countElementInList x y = length $ filter (y==) x
listToNumberOfElements x = zip (nub x) (map (\a -> countElementInList x a) (nub x))
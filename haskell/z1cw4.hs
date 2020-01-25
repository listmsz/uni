
--Zadanie 1
module A
where
    import Data.List
    podzbior _ [] = True
    podzbior [] _ = True
    podzbior xs ys = all (`elem` ys) xs
    iloczyn [] _ = []
    iloczyn _ [] = []
    iloczyn x y = filter (`elem` y) x 
    suma x y = nub (x ++ y)
    roznica x y = filter ((`notElem` y))x 


--- program (do wklejenia do osobnego pliku)
--import A
--iloczyn [1,2,3] [2,3,4] 
--suma [1,2,3] [2,3,4] 
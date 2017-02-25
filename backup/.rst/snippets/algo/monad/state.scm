import Control.Monad.ST
-- import Control.Monad.State

type S = Int
data SM a = SM (S -> (a,S)) 

s1 = do
 let a = return 1 :: ST s Int
 print $ runST a

-- type Op = State [Int] Int

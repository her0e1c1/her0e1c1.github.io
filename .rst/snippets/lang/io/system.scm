
;; ghc -e 'System.Cmd.system $ "touch " ++ unwords [[x, ''.''] ++ y | x <- [''a''..''c''], y <- ["csv", "txt"]]'

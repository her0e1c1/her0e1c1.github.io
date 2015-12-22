

(run "python -c 'print(\" \".join([\"%s.%s\" % (x,y) for x in [\"a\", \"b\", \"c\"] for y in [\"txt\", \"csv\"]]))'")



;; ghc -e 'putStr $ unlines $ map show [1..3]'



(run "python -c 'print(\" \".join([\"%s.%s\" % (x,y) for x in [\"a\", \"b\", \"c\"] for y in [\"txt\", \"csv\"]]))'")


;; ghc -e 'putStr $ unlines $ map show [1..3]'


(run "perl -E 'say join \" \", 1..10'")
(run "perl -E 'say join \" \" , map {sprintf \"%03d\", $_} 1..10'")
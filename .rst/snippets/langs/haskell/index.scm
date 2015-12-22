(load-from-current-dirctory "include.scm")
(define run oneliner-run+)


;; (+) 1 -1    (+) 1 (-1)

;; import Data.Bits(bitSize) size = bitSize 0"   size = bitSize (0 :: Int)   型を明示

;; maxInt maxBound::Int

;; (flip +)    (flip (+))  記号関数を引数にする場合、括弧が必要

;; read "10"
;; reads "10"   "read ""10"" :: Int
;; reads "10" :: [(Int, String)]"    型を指定する必要あり

;; do{x<-Just 1; return x+1}           do{x<-Just 1; return (x+1)}

;; f Just x = 1
;; f (Just x) = 1
;; 括弧がないと、関数fの引数が2つとる意味になる

;; [1,True]
;; [a]

;; (1::Int) == (1::Integer)

;; a <- return (Just 1)
;; ghc -e 'writeFile "$FILENAME" ""'
;; ghc -e 'System.Cmd.system $ "touch " ++ unwords [[x, ''.''] ++ y | x <- [''a''..''c''], y <- ["csv", "txt"]]'
;; ghc -e '1:[2,3]'
;; ghc -e "drop 1 [1,2,3]"
;; 2^63::Int
;; Data.Map.fromListWith (++) [(1, "a"), (1, "b"), (2, "c")]
;; ghc -e 'print "hello world"'
;; ghc -e "tail [1,2,3,4,5]"
;; ghc -e '[1,2,3] ++ [4]'
;; ghc -e 'all even [0,2,4]'
;; ghc -e 'any even [1,2,3]'
;; ghc -e 'any id [True,False,False]'
;; ghc -e "concatMap (\a->[a, ',']) ['a'..'e']"  # "a,b,c,d,e,"
;; ghc -e 'Data.List.nub [1,1,1,2,2,3]'
;; let add :: Int -> Int -> Int; add x y = x + y in add 1 2
;; 2^100 ::Float
;; ghc -e 'head [1,2,3]'
;; ghc -e 'length [1,2,3]'
;; ghc -e 'reverse [1,2,3]'
;; ghc -e 'foldl1 (+) [1,2,3]'
;; ghc -e 'putStr $ reverse "hoge"'
;; ghc -e 'putStr $ unlines $ map show [1..3]'
;; ghc -e 'foldl (flip (:)) [] [1,2,3]'
;; ghc -e 'last [1,2,3]'
;; ghc -e 'System.Directory.getDirectoryContents "." >>= return . unlines >>= putStr'
;; ghc -e 'replicate 3 1'
;; ghc -e 'elem 1 [1,2,3]'

# あ〜かを出力
ghc -e "putStrLn $ unwords $ map (\x -> [x]) ['あ' .. 'か']"  # あ ぃ い ぅ う ぇ え ぉ お か

ghc -e 'print(read "10" :: Integer)'

ghc -e 'map Data.Char.toUpper "abc def"'

ghc -e 'System.FilePath.takeFileName "/path/to/file.txt"'

# ~/.emacsを文字列で読み込む
ghc -e 'System.Directory.getHomeDirectory >>= \x -> return (x ++ "/.emacs") >>= readFile'

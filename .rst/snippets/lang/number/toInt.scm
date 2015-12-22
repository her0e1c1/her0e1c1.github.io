
;; read "10"
;; reads "10"   "read ""10"" :: Int
;; reads "10" :: [(Int, String)]"    型を指定する必要あり

ghc -e 'print(read "10" :: Integer)'

(p "文字列を数値に変換する")
(node "Number('123')")
(node "parseInt('123', 10)")
(node "parseFloat('123')")
(node "parseInt('100px'.replace('px', ''))")

(node "1 + (+ '22')")
(node "'100' | 0")

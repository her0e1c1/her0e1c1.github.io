
;; ghc -e 'writeFile "$FILENAME" ""'

;; .. warning::
;;    ``print FH $line;`` ここの,はいらない

(cpp "cout << \"str\";")
(cpp "cout << flush;")
(cpp "cout << endl;")
(cpp "cout << \"bool: true \" << true << \", false \" << false << endl;"
     :msg "Don't worry about type like int, string, or bool etc.")

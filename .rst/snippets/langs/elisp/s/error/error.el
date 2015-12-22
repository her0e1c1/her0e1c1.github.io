; (unwind-protect BODY CLEAN-UP-FORMS)
; bodyがエラーを起こしても、必ずCLEAN-UP-FORMSが呼ばれる
; エラーはエラーのまま処理される
; エラーがない場合はBODYの評価値を返す。(CLEAN-UP-FORMSも呼ばれる)

(unwind-protect
    (/ 1 0)
  (print "before error occurs, print this"))

(unwind-protect
    (/ 1 1)
  (print "always print this"))


; Catch errors and return nil
(ignore-errors
  (/ 1 0))

; Return the last expression
(ignore-errors
  (/ 10 1) 2 nil 1)  ; 1

; unwind-protectとignore-errorsを使い
; エラーをキャッチして処理を続ける(失敗した場合はnil)
(ignore-errors
  (unwind-protect
      (/ 1 0)
    (print "always print this")))
(load-from-current-dirctory "include-nodejs.scm")
; TODO: http://sweetjs.org/ macroで書き直す

(run "typeof \"s\" === \"string\"")

(p "NaN stands for Not a Number")
(run "isNaN(NaN)")
(run "(NaN === 1)")
(run "(NaN === NaN)")

(run "1 == \"1\"")
(p "=== needs strict type")
(run "1 === \"1\"")
(run "1 / 0 === Infinity")

(p (sphinx-section "Math"))
(p "Return a value between 0 and 1 (not including 1)")
(run "Math.random()")
(p "Return a value from 0 to 6")
(run "Math.floor(Math.random() * 7)")
(p "Return the minimum value")
(run "Math.min(1, 2, 3)")


(p "Iterate an array")
;(run "var l=[1,2,3]; ")
; Using lengh method
"for (var i = 0; i < l1.length; i++) console.log(l1[i]);"

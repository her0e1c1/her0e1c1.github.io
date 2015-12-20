(load-from-current-dirctory "include-nodejs.scm")

(run "typeof \"s\" === \"string\"")

(p "NaN stands for Not a Number")
(run "isNaN(NaN)")
(run "(NaN === 1)")
(run "(NaN === NaN)")

(run "1 == \"1\"")
(p "=== needs strict type")
(run "1 === \"1\"")
(run "1 / 0 === Infinity")

(run "\"abc\" + \"efg\"")
(run "undefined || null || \"\" || 0 || false")
(run "typeof a === \"undefined\"")
(run "true && \"ok\" || \"no\"")
(run "Math.min.apply(null, [1,2,-1,3])")

(p (sphinx-section "Math"))
(p "Return a value between 0 and 1 (not including 1)")
(run "Math.random()")
(p "Return a value from 0 to 6")
(run "Math.floor(Math.random() * 7)")
(p "Return the minimum value")
(run "Math.min(1, 2, 3)")
(run "Math.ceil(5.5)")
(run "Math.ceil(-5.5)")
(run "Math.E")
(run "Math.floor(-5.5)")
(run "Math.floor(5.5)")
(run "Math.PI")

(ps "json")
(run "\"a\" in {a: 1}")
(run "{a: 1}.hasOwnProperty(\"a\")")
(run "{a: 1, b: 2}.a")
(run "{a: 1}.hasOwnProperty(\"a\")")

(p "string => json. keyは\"\"で囲むこと")
(run "JSON.parse('{\"key\": \"val\"}')")
(run "JSON.stringify({\"key\": \"val\"})")

(p "Iterate an array")
;(run "var l=[1,2,3]; ")
; Using lengh method
; "for (var i = 0; i < l1.length; i++) console.log(l1[i]);"

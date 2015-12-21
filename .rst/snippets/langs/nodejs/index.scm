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
; a=[1,2,3]; a.push(4); console.log(a)

(run "[1,2,3,4,5].filter(function(elem, index, array){return elem % 2 == 0;})")
(run "[1,2,3].indexOf(1) >= 0")
(run "\"hello world\"")
(run "[1,2,3].reduce(function(a,b){return a+b;})")
(run "[1,2,3].length")

(ps "date")
(p "現在の時刻のインスタンス作成")
(run "new Date();")
(p "特定の日付")
(run "new Date(2000, 0, 1)")
(p "== -- 型が等しい　かつ　値が等しい")
(run "new Date(2000, 0, 1) < new Date(2000, 11, 31)")

(p "= --  値が等しい")
(run "1 == \"1\"")
(run "1 == 1")
(run "1 === 1")
(run "1 === \"1\"")
(run "{} == {}")
(run "[] == []")
(p "Infinity")
(run "1/0 === 2/0")
(p "NaNvar")
(run "0/0 === 0/0")

;; C = function(val){
;;     this.val = val;
;; };
;; function _sort(c1, c2){
;;     return c1.val - c2.val;
;; };
;; var data = [];
;; data[0] = new C(3);
;; data[1] = new C(1);
;; data[2] = new C(2);
;; data.sort(_sort);var a = {
;;  a: 1,
;;  b: 2,
;;  c: 3,
;; };

;; for(var key in a){
;;  a[key] += 1;  // key = a or  b or c
;; }

;; aday = new Date(2000, 12, 31);
;; new Date(day.getFullYear(), day.getMonth(), day.getDate() + 1);

(ps "typeof")
(run "typeof(true)")
(run "typeof(123)")
(run "typeof('abc')")
(run "typeof({})")
(run "typeof([])")
(run "typeof /regexp/")
(run "typeof function(){}")
(run "typeof null")
(run "typeof undefined")

(ps "instanceof")
(run "[] instanceof Array")
(run "/regexp/ instanceof RegExp")
(run "/regexp/ instanceof Function")
(run "(function(){}) instanceof Function")
(run "undefined instanceof Object")
(run "null instanceof Object")

(p "文字列を数値に変換する")
(run "Number('123')")
(run "parseInt('123', 10)")
(run "parseFloat('123')")

(run "1 + (+ '22')")
(run "'100' | 0")
(run "a = 1/0;")
;; ``Not a Number`` の略です
(run "NaN !== NaN")

; 名前付きグループ化
(run "'abc'.match(/a.c/)")
(run "{a: 1, b: 2}.a")
(run "{a: 1, b: 2}[a]")
(run "{a: 1, b: 2}['a']")
(run "Object.keys({a:1, b:2});")
; a["forth"] = 1;

(p "書く時には\"key\"とクオテーションで括らなくても良いです。")
(pw "jsonデータは改行など、余計な文字が入ってはいけません。")

;; メソッドをjsonに組み込ませます。 ::

;;   f.prototype = {
;; 	 init : function(){},
;; 	 method1: function(){}
;;   }

(run "'太字'.bold()")
(run "'斜体'.italics()")
(run "'固定幅フォント'.fixed()")
(run "'大きなフォント'.big()")
(run "'小さなフォント'.small()")
(run "'ブリンク'.blink()")
(run "'打ち消し線'.strike()")
(run "'上付き'.sup()")
(run "'下付き'.sub()")
(run "'赤い文字'.fontcolor('red')")
(run "'フォントサイズ7の文字'.fontsize(7)")
(run "'アンカー'.anchor('xxx')")
(run "'リンク'.link('index.html')")

(run "'ABCDEF'.match(/DEF/i)")
(run "replace(/aaa/g, 'bbb');")
(run "parseInt('100px'.replace('px', ''))")

;; var c = [];
;; document.cookie.split(":").forEach(function(e){
;;   c.push(e.split("="));
;; })

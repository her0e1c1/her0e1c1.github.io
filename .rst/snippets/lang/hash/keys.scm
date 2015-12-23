

(p "get all hash keys")
(run "perl -E '%a=(a=>1, b=>2); say keys %a'")
; count up
(run "perl -E 'say keys %{{map {$_ => 1} (1,1,1,2,2,3)}}'")

(node "Object.keys({a:1, b:2});")
;; // key = a or  b or c
;; var a = {a: 1,b: 2,c: 3,};
;; for(var key in a){
;;  a[key] += 1;
;; }


(zsh "typeset -A y; y=(a 1 b 2 c 3); echo ${(@k)y}")

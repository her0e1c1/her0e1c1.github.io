(load-from-current-dirctory "include-sh.scm")

(ps "function")

(p "declare minimum")
(run "f(){}")

(pw ";がないとエラー")
(run "f(){ echo 1 }; f")
(run "f(){ echo 1;}; f")

;; # {の後にspace必要。
(pw "need a space after {")
(run "f(){echo 1;} ;f")
(run "f(){ echo 1;};f")

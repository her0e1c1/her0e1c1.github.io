
(sh "f(){}" :msg "declare minimum")

(sh "f(){ echo 1 }; f" :warn "missing ;")
(sh "f(){ echo 1;}; f")

(sh "f(){echo 1;} ;f" :warn "need a space after {")
(sh "f(){ echo 1;};f")

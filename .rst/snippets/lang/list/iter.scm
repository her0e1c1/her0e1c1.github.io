
(node "var l=[1,2,3];for(var i=0; i<l.length; i++) P(l[i]);")

(cpp "for(int i: {1,2,3}) P(i);")
(cpp "for(char ch: \"abcde\") P(ch);")

(zsh "for i in (1 2 3); do echo $i; done" 
     :warn "You can't use (), which is an error")
(zsh "a=(1 2 3 4 5); for i in ${a[@]}; do echo $i; done")

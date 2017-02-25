
(run "perl -E '%a=(a=>1, b=>2); while(($k, $v) =each %a){say \"$k = $v\"}'")

(zsh "typeset -A y; y=(a 1 b 2 c 3); echo ${(@kv)y}")

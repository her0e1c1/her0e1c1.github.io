
(zsh "typeset -A y; y=(a 1 b 2 c 3); echo $y")
(zsh "typeset -A y; y=(a 1 b 2 c 3); echo ${(@v)y}")
(zsh "typeset -A y; y=(a 1 b 2 c 3); echo ${(@M)y}")

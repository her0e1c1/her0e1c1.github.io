
(zsh "f=/home/usr/test.txt; echo ${f##*/}" :msg "remove if it's matched from the left side(greedy)")
(zsh "f=/home/usr/test.txt; echo ${f#*/}"  :msg "remove if it's matched from the left side(non greedy)")
(zsh "f=/home/usr/test.txt; echo ${f%%*/}" :msg "remove if it's matched from the right side(greedy)")
(zsh "f=/home/usr/test.txt; echo ${f%*/}" :msg "remove if it's matched from the right side(non greedy)")

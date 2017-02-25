
(emacs (s-chomp "ABC\n"))

(p "一つだけ除去")
(emacs (s-chomp "ABC\n\n"))

(p "ない場合は何もしない")
(emacs (s-chomp "ABC"))

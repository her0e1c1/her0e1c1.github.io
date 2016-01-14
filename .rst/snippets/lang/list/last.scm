
(py "print([1,2,3][-1])")
(perl"@a=(split \" \", \"a b c d e\")[-1]; say @a")

(run "ghc -e 'last [1,2,3]'")


(emacs (-last-item '(1 2 3)))
(emacs (last '(1 2 3)) :msg "return a list")

(cpp "vector<int>v{1,2,3}; P(v.back());")


(run "python -c 'print(\"\".join(reversed(\"hoge\")))'")
(run "python -c 'a=[1,2,3]; a.reverse(); print(a)'")
(run "python -c 'print(list(reversed([1,2,3])))'")

(run "ghc -e 'reverse [1,2,3]'")
(run "ghc -e 'putStr $ reverse \"hoge\"'")

(run "perl -E 'say scalar reverse shift' hoge"
     :msg "reverse関数に文字列として評価させたいのでscalar必要")

(cpp "VIa={1,2,3}; reverse(a.begin(), a.end()); PE(a)'")

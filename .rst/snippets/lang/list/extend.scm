
(run "ghc -e '[1,2,3] ++ [4]'")
(cpp "VI a{1,2,3}, b{4,5};a.insert(a.end(), b.begin(), b.end());PE(a)")
(cpp "string a(\"abc\"), b(\"cd\");a.insert(a.end(), b.begin(), b.end());P(a)")

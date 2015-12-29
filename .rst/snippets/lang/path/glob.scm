(run "python -c 'import os; print(\"\n\".join(os.listdir(\".\")))'")
(run "ghc -e 'System.Directory.getDirectoryContents \".\" >>= return . unlines >>= putStr'")
(run "perl -E 'say for glob(\"*\")'")

(gosh (glob "*"))
(gosh (glob "../.*"))
  ; 隠しファイルは明示的に.が必要
(gosh (glob "**/*.h"))
  ;再帰的に.hにマッチ（階層は2とは限らない）

(emacs (f-glob "./*.scm"))

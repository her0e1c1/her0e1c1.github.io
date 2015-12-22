(run "python -c 'import os; print(\"\n\".join(os.listdir(\".\")))'")
(run "ghc -e 'System.Directory.getDirectoryContents \".\" >>= return . unlines >>= putStr'")
(run "perl -E 'say for glob(\"*\")'")

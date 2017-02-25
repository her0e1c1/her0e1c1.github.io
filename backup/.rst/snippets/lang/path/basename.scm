(ps "basename")

(ruby "puts File.basename(\"/path/to/file.txt\")")
(ghc "System.FilePath.takeFileName \"/path/to/file.txt\"")

(run "perl -M'File::Basename' -E 'say basename qq#/path/to/text.txt#'")
(run "perl -M\"File::Basename\" -E 'say basename \"/path/to/file.txt\"'")

(gosh (sys-basename "foo/bar/bar.z"))
(emacs (f-filename "/root/file/text.txt"))
(emacs (f-base "/root/file/text.txt"))

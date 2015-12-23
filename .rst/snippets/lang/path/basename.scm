(ps "basename")

ruby -e 'puts File.basename("/path/to/file.txt")'  # file.txt
ghc -e 'System.FilePath.takeFileName "/path/to/file.txt"'

(run "perl -M'File::Basename' -E 'say basename qq#/path/to/text.txt#'")
(run "perl -M\"File::Basename\" -E 'say basename \"/path/to/file.txt\"'")

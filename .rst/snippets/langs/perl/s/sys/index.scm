(load-from-current-dirctory "include-perl.scm")

(ps "copy")
; (run "perl -M\"File::Copy qw(cp)\" -e 'cp $_, $_.\".bak\" for grep {-f} glob(\"*\")'")

(ps "move")

(p "ファイルシステムをまたいでmove")
(run "find ./ -print0 | perl -MFile::Copy -MFile::Basename -l0ne 'move($_, \"/path/to/\" . basename($_)'")

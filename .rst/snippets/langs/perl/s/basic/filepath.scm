(load-from-current-dirctory "include-perl.scm")

(ps "filepath")

(run "perl -E '$_=\"/home\"; say if -d'")

(ps "basename")

(run "perl -M'File::Basename' -E 'say basename qq#/path/to/text.txt#'")
(run "perl -M\"File::Basename\" -E 'say basename \"/path/to/file.txt\"'")

(run "perl -M'File::Spec' -E 'say File::Spec->catfile(q#/path/to#, q#text.txt#)'")

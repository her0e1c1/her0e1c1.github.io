
(run "perl -M'File::Spec' -E 'say File::Spec->catfile(q#/path/to#, q#file.txt#)'")
(emacs (f-join "/path" "to" "file.txt"))
(gosh (build-path "/path" "to" "file.txt"))


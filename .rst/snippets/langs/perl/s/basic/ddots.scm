(load-from-current-dirctory "include-perl.scm")

(ps "// .. // operator")

;; # 以下のコードと同じ
;; # my $process_this = 0;
;; # while (<$file>) {
;; #   $process_this = 1 if /START/;
;; #   $process_this = 0 if /END/;
;; #   process_this_line($_) if $process_this;
;; # }

(run "echo \"a\nb\nSTART\nc\nEND\ne\" |perl -nle 'print if /^START$/ .. /^END$/'")

;; # {"key": " => {"key": u"
;; perl -i -pE '461 .. 488 and s/(?<=: )(?!u)/u/' filepath

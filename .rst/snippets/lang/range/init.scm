

;; maxInt maxBound::Int

(run "perl -E 'say $_ + 1 for 1..10'")
(run "perl -E 'say for 1..3'")


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

(zsh "echo {1..10}")

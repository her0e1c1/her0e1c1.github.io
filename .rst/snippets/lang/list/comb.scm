
(run "perl -E 'say join \" \", glob(\"{a,b,c}.{txt,csv}\")'")
(run "perl -E 'for $i (qw/a b c/){for(qw/txt csv/){`echo $i.$_`}}'")

(zsh "echo {a,b,c}.{txt,csv}")

(zsh "echo FILE.txt{,.bak}" :msg "for backup")

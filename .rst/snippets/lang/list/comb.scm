

(run "perl -E 'say join \" \", glob(\"{a,b,c}.{txt,csv}\")'")
(run "perl -E 'for $i (qw/a b c/){for(qw/txt csv/){`echo $i.$_`}}'")

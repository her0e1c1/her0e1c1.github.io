(load-from-current-dirctory "include-perl.scm")

(ps "hash")
(run "perl -E '%a=(a=>1); say exists($a{\"a\"})'")
(run "perl -E '%a=(a=>1, b=>2); say $a{a}'")

(p "get all hash keys")
(run "perl -E '%a=(a=>1, b=>2); say keys %a'")

(run "perl -E '%a=(a=>1); say exists($a{a})'")
(run "perl -E '%a=(a=>1); say %a ~~ /^a$/'")
(run "perl -E '%a=(a=>1, b=>2); while(($k, $v) =each %a){say \"$k = $v\"}'")

(run "perl -E 'say keys %{{map {$_ => 1} (1,1,1,2,2,3)}}'")

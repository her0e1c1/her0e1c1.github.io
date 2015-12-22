(load-from-current-dirctory "include-perl.scm")

(ps "diamond operator")

(run "perl -e 'for(<*.txt>){$a=$_; s/\.txt/\.csv/; rename $a, $_}'")

(run "ls |perl -E 'say reverse <>'perl -E 'say \"sample.CsV\" =~ /.*\.csv/i'")

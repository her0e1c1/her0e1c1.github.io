
(run "python -c 'import re; print(re.match(r\".\", \"\n\", re.DOTALL))'")

(run "perl -E 'say q/./ =~ /./'"
     :msg ". matches also dot character")

(run "perl -E 'say \"\n\" =~ /./'"
     :warn " . doesn't match \n character Ignore white words( \n\r\t) ")


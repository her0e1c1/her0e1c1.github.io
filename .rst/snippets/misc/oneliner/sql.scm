(load-from-current-dirctory "include.scm")


;; mysqldump -u USER DB TABLE -t --compact --skip-extended-insert |perl -plE 's/(?<=VALUES \()(\d+)/$1+10000/e'

;; # idはnullにしておけば、mysql側でよしなに値をいれてくれる 
;; mysqldump -u USER DB TABLE -t --compact --skip-extended-insert |perl -plE 's/(?<=VALUES \()(\d+)/NULL/'perl -e 'open F, ">$FILENAME"; print F ""'

; perl -E '$s=chr 39;for$p(house, land){for$i(1..10){$n="${p}_$i"; $a=qq/insert into property_group (name, type, g_id) values ($s$n$s, $s$p$s,$i)/; say qq/mysql -u USER DB -e "$a"/}}'

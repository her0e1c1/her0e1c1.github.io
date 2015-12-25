(p "positive")

(p "置換などで、マッチさせずに置換対象を狭めるのに使う")
(p "src=\"../ => src=\"/")
(run "echo 'src=\"../' |perl -plE 's#(?<=src=\")[.][.]/#/#'")


;;; test

(run "echo test|s -n '#/(?<=.*?)st/ (p (it 0))'")

(pw "python, perlの場合、後読みでは、正規表現が使えない(*とか)")

(py "P(match(r\"(?<=.*?)st\", \"test\"))")

(run "perl -E 'q/test/ =~ m#(?<=.*?)st#'")
(run "perl -E 'q/test/ =~ m#(.*?e)\\K.*# and say $&'"
     :msg "You can subsutitute lookbind with \\K option")

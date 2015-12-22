(load-from-current-dirctory "include-perl.scm")

(ps "function")

(p "引数が@_に格納されてるので、そのどれかを取り出す感じ")
(run "perl -e 'sub {print $_[rand @_] for 1 .. 255}->(\"a\" .. \"z\", 0 .. 9, \"A\" .. \"Z\")'")

(run "perl -e 'sub {print \"@_\"}->(\"a\" .. \"z\", 0 .. 9, \"A\" .. \"Z\")'")

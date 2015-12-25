
(p "Using brace means escaping dot"
(run "perl -E \"say 'aab' =~ m/a[.]b/\"")
(run "perl -E \"say 'a.b' =~ m/a[.]b/\"")
(run "perl -E \"say 'a.b' =~ m/a\.b/\"")



(p "$\"")
(p "This is a \"@array\" delimiter")
(run "perl -E '$\" = \" - \"; @a=1..5; say \"@a\"'")

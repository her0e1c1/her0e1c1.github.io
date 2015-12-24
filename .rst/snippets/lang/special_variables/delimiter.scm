
(sh "echo -n $IFS | cat -vte")

(p "zshだと上記でsplitできないのでechoで対応(互換あり)")
(sh "a='a b c'; for i in `echo $a`; do echo $i;done")

(p "delimter")
(sh "IFS=':' && for p in $PATH; do echo $p ; done")

(p "$\"")
(p "This is a \"@array\" delimiter")
(run "perl -E '$\" = \" - \"; @a=1..5; say \"@a\"'")

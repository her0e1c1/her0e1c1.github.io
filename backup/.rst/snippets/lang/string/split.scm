
(perl "say split /\s/, \"a b c\"")
(sh "a='a b c'; set -- $a; for i in $a; do echo $i;done"
    :msg "shellのsplitについて補足 文字列の分割は、 set -- $var で行う 初期値の区切り文字は、$IFS")
(zsh "a=\"a b c\"; for i in ${(s/ /)a}; do echo $i; done")
(zsh "A='a b c' && for i in ${(s: :)A}; do echo $i; done")
(emacs (split-string "a b c" " "))
(emacs (s-split " " "a b c"))
(node "P('a b c'.split(' '))")
(py "P('a b c'.split(' '))")


;; vector<string> split( string s, string c ) {
;;   vector<string> ret;
;;   for( int i=0, n; i <= s.length(); i=n+1 ){

;;     n = s.find_first_of( c, i );
;;     if( n == string::npos ) n = s.length();
;;     string tmp = s.substr( i, n-i );
;;     ret.push_back(tmp);
;;   }
;;   return ret;
;; }

;; // spaceが区切り文字の場合
;; string str = "alex delia john";
;; std::istringstream iss(str);
;; std::vector<string> vec( (std::istream_iterator<string>(iss)),
;;                          std::istream_iterator<string>() );


(ps "one")
(emacs (split-string "-" "-"))

(ps "empty")
(emacs (split-string "" ""))


(ps "split new lines")
(zsh "a=$(echo 'a\nb\nc'); echo ${(qqf)a}")
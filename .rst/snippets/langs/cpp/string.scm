(load-from-current-dirctory "include.scm")
(define run oneliner-run+)
(define (run+ cmd)
  (let* ((replaced (regexp-replace-all #/'/ cmd "'\\\\''"))
         (c #"cpe '~replaced'"))
    (oneliner-run+ c)))

(ps "string")
; typedef basic_string<char> string

(ps "Declare")
(run+ "string s = \"test\"; P(s)")
(run+ "string s(\"test\"); P(s)")
(run+ "char s[] = \"test\"; string t(s); P(t)")

(p "指定した文字で初期化します。")
(run+ "string s(5, '0'); P(s)")

(ps "char")
(run+ "string s; s=char('A' + 1); P(s)")
(run+ "string s; s='A'+1; P(s)")
(pw "cannot declare with char")
(run+ "string s='A'+1;")
(run+ "string s=\"hoge\"; P((s[0]-'0')+(s[1]-'0') == (s[0]+s[1]-2*'0'))")

(ps "set!")
(p "一文字だけ書き換えることができます。")
(run+ "string s=\"abcdefg\"; s[3]='z'; P(s)")

(ps "append")
(run+ "string s; for(char ch = 'a'; ch <= 'z'; ch++) s += ch; P(s)")

(ps "substr")
(run+ "string s = \"test\"; string t(s,1,2); P(t)")
(run+ "string s = \"test\"; string t(s.begin()+1, s.begin()+2); P(t)")

(run+ "string s=\"abcdefghi\"; P(s.substr(0, 5));")
(run+ "string s=\"abcdefghi\"; P(s.substr(5, 10));")

(pw "開始位置が範囲外の場合は例外を出します。")
(run+ "string s=\"abcdefghi\"; P(s.substr(10, 5));")
(run+ "string s=\"abcdefghi\"; P(s.substr(10, 1000));")

(ps "辞書による比較が可能")
(run+ "P(\"aaa\" < \"bbb\")");
(run+ "P(\"aaa\" <= \"aaa\")");
(run+ "P(\"aaa\" < \"aab\")");

(pw "長さが異なる場合は、なぜか短い方が大きいと判断される???")
(run+ "P(\"aaa\" < \"a\")");

(ps "find")
(run+ "P(string::npos == -1)")
(run+  "string s = \"this is a test.\"; P(s.find(\"is\") != string::npos)")
(run+  "string s = \"this is a test.\"; P(s.find(\"IS\") != string::npos)")
(p "char is also available")
(run+  "string s = \"this is a test.\"; P(s.find('.') != string::npos)")

  ;; /*
  ;;   find_first_not_of関数のサンプルです。
  ;;   引き数にした文字以外が登場した場合、見つけた始めのインデックスを返します。
  ;;   引き数にした文字しか出てきていない場合はstring::nposを返します。

  ;;   output:
  ;;    The first non-alphabetic character is - at position 12

  ;;    なお、findの戻り値は、型string::size_typeで受け取る必要があります。
  ;;    (警告はでますが、intでも可能です。)
  ;; */
  ;; string str ("look for non-alphabetic characters...");
  ;; string::size_type found;
  ;; found= str.find_first_not_of("abcdefghijklmnopqrstuvwxyz ");
  ;; if (found != string::npos)
  ;;   {
  ;;     cout << "The first non-alphabetic character is " << str[found];
  ;;     cout << " at position " << found << '\n';
  ;;   }


(ps "count")
(run+ "string s=\"abcaba\"; P(count(s.begin(), s.end(), 'a'));")
(p "count up each charactor")
(run+ "vector<int>d('Z'-'A'+1,0); string s=\"AAABBC\"; for(char c = s;c;c++) d[c-'A']++; PE(d)")

(ps "toString")
(run+ "std::ostringstream oss; oss << 12345; P(oss.str());")

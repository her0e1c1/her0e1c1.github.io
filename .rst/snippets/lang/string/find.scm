
(cpp "P(string::npos == -1)")
(cpp  "string s = \"this is a test.\"; P(s.find(\"is\") != string::npos)")
(cpp  "string s = \"this is a test.\"; P(s.find(\"IS\") != string::npos)")
(p "char is also available")
(cpp  "string s = \"this is a test.\"; P(s.find('.') != string::npos)")

(emacs (s-contains? "text" "This is a text."))

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

(ps "strstr")

(p "if searching an empty string, it is always true.")
(c "p(\"(%s)\", strstr(\"\", \"\"));")
(c "p(\"%s\", strstr(\"abcde\", \"\"));")
(c "p(\"%s\", strstr(\"abcde\", \"ABC\"));")

(c "ps(strstr(\"123456789\", \"345\"));"
   :msg "s1にs2の文字列が一致した場合、その先頭ポインタを返す")
(c "ps(strstr(\"123456789\", \"355\"));")
(c "char *p=\"abcdebce\", *q=\"bc\"; printf(\"%p\", strstr(p, q));")

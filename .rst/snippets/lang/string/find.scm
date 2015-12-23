

(cpp "P(string::npos == -1)")
(cpp  "string s = \"this is a test.\"; P(s.find(\"is\") != string::npos)")
(cpp  "string s = \"this is a test.\"; P(s.find(\"IS\") != string::npos)")
(p "char is also available")
(cpp  "string s = \"this is a test.\"; P(s.find('.') != string::npos)")


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

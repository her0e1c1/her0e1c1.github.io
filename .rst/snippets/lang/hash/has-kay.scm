
python -c 'print("a" in {"a": 1})'

# シンボルと文字列を区別する
ruby -e 'puts ({:a => 1}.key? "a")'  # false

(node "{a: 1}.hasOwnProperty(\"a\")")
(node "\"a\" in {a: 1}")

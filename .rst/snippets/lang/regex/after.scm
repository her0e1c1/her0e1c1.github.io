
(p "最後にマッチした部分に続く文字列")

(run "perl -E \"qq/pre 1234 post/ =~/\d+/; say $'\"")

(p "file.min.js => file.js")
(run "echo /path/to/file.min.js | perl -nlE '/\.min/;say qq/$`$'\\''/'")
(run "echo /path/to/file.min.js | s -p '#/\.min/ #\"~(it (quote before))~(it (quote after))\"'")

(pw "There is no function about this in python")

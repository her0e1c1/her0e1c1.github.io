
(run "perl -E 'say length shift' 1234567890")
(gosh (string-length "test"))

(pw "文字長とバイト長を区別すること")
(gosh (string-length "あいうえお"))


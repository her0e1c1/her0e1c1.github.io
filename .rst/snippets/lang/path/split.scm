
(emacs (f-split "/path/to/file.txt"))

(gosh (receive (dir base ext)(decompose-path "/path/to/file.txt") (list dir base ext)))

(f-split "/root/file/text.txt")  ; ("/" "root" "file" "text.txt")
(f-base "/root/file/text.txt")  ; "text"
(f-ext "/root/file/text.txt")  ; "txt"
(f-ext "/root/file/text.tar.gz")  ; "gz"

(f-files "~/")
(f-directories "~/")

(f-read-text "~/.emacs")
(f-write-text "this is a text" 'utf-8 "~/test")
(f-delete "~/test")
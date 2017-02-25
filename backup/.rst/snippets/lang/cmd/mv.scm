
; (run "find ./ -print0 | perl -MFile::Copy -MFile::Basename -l0ne 'move($_, \"/path/to/\" . basename($_)'" :msg "ファイルシステムをまたいでmove")

(gosh (let* ((s "a.txt") (d "b.txt"))
        (touch-file s)
        (move-file s d)
        (remove-file d)))

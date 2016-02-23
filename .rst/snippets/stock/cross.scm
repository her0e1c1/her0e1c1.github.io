
(ps "ゴールデンクロスの条件")

(math "
slow(i+1) - fast(i+1) $ge 0
$bigwedge
slow(i) - fast(i) $le 0
")

(ps "デッドクロスの条件")

(math "
slow(i+1) - fast(i+1) $le 0
$bigwedge
slow(i) - fast(i) $ge 0
")

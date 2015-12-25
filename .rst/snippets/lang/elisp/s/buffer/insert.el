;;; bufferに文字列を入力する

;;; insertは、現在のカーソルから入力を開始
(with-current-buffer (get-buffer "*scratch*")
  (insert "hello world!"))
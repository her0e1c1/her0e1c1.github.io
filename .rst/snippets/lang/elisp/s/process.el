

;       (pop-to-buffer (process-buffer (python-shell-get-or-create-process)) t)

(process-list)

(get-buffer-process (current-buffer))

; コマンドを実行した結果をバッファに表示します.
(compilation-start "ls")

 (call-process-region BEGIN END "COMMAND" &optional DELETE BUFFER)

 指定したBEGINからENDまでのバッファの内容を標準入力にして、
 "COMMAND"を実行します。

 DELETEがnon-nilの場合は、引き数にした文字列をバッファから削除します。

 BUFFERが0の場合は、すぐにnilを返します。
 その他の場合は、起動したプロセスが終了するのを待ちます。



process-mark

(delete-process name)
(list-processes)
(get-process name)
(process-status process-name)
(process-send-string process-name string)
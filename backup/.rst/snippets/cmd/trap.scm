
`Ctrl-C` による割り込みをキャッチして、指定したコマンドを実行する ::

   trap "echo hi" SIGINT

`Ctrl-C` によるコマンドキャンセルを無効にする ::

  trap true SIGINT

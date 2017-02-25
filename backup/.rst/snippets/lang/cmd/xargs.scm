# # -r (何もしない。初期で空の場合はコマンドを実行しない)
# echo | xargs ls  # 何もおこならい
# echo / | xargs ls  # ls /

# # -t 実行コマンド表示
# find . | xargs -t

# # -p 実行コマンドの確認
# ls | xargs -p rm

# # -s ARG_MAX 実行コマンドの文字長の最大
# perl -e 'print "a" x 5' | xargs -ts 15
# # /bin/echo aaaaa
# # aaaaa
# perl -e 'print "a" x 5' | xargs -ts 14  # error!

# # -n LINES 最大引数を設定(コマンドを分割して実行)
# ls | xargs -n 1  # 1つずつecho
# ls | xargs       # まとめてecho

# # -I REPSTR REPSTRを標準入力に置き換える(初期値5回)
# # -L NUM 行ごとにコマンドを実行する
# echo a | xargs -I % echo % % % % % %  # a a a a a %

# # -R NUM 置き換える回数を指定
# echo a | xargs -R 1 -I % echo % % % % % %  # a % % % % %
# # -R 0は指定なしと同様に扱われる(!Rflag)
# echo a | xargs -R 0 -I % echo % % % % % %  # a a a a a %
# # -R -1（負の数）は無限置き換える
# echo a | xargs -R -1 -I % echo % % % % % %  # a a a a a a

# # 標準入力を分割せずに一つにまとめてtarしたい場合
# # find . -name "log*" -print0 | tar -cvz -T - --null -f /tmp/log01.tar.gz

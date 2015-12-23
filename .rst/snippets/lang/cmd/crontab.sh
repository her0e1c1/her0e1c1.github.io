# cronでは特定の祝日に実行のようなカレンダーを加味した実行はできない
# 年一回などの定期実行はテストしにくいので、リスク
# 日と曜日が両方指定された場合、OR条件

# todo
# 多重起動を防ぐシェルスクリプトも考慮するスクリプト
# 1秒ごと 
# MAILTO

# crontabを使うとBSDやLINUXのディレクトリ構成の差を吸収できる
:freebsd: /var/cron/tabs/

# list settings
crontab -l

# edit (after editing, you need not restart cron daemon)
crontab -e

# delete all settins
crontab -r 

# specify user
crontab -u root -l

# backup
crontab -l > ~/cron.bak

# 指定したファイルをcrontabに反映
echo "0-59 * * * * echo $PATH |logger" > 1; crontab 1

# order
# 分 時 月 年 曜日 cmd
# 0-59 * * * * /bin/echo hello |logger

# a relative path command is ok
# 0-59 * * * * echo hello |logger
# PATH=/usr/bin:/bin

# you CAN'T do more than one commands with ; delimiter
# 0-59 * * * * echo 1; echo 2; |logger

# 月曜日の１０時５分にhoge.shを実行する
5 10 * * 1 /path/to/hoge.sh

.. csv-table::

 日,0
 月,1
 火,2
 水,3
 木,4
 金,5
 土,6

 指定した間隔で実行
 0,15,30,45

 1から5の間
 1-5

 間隔を決める
 1-5/2  #  1,3,5と同じ


# home direcotryで管理
crontab  ~/.crontab
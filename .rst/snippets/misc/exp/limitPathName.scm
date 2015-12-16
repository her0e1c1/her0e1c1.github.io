
# パスの長さ(ディレクトリは含めない)
getconf _POSIX_PATH_MAX  # 256

# 文字長を１文字超えているのでエラー
perl -e 'print "a" x 256' |xargs touch

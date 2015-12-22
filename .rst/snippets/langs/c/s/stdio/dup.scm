# 参考 http://qiita.com/stc1988/items/9354204d3c2ff210512b

truss sh -c "echo hoge > sample.txt"

ce 'int fd=open(argv[1], 0); dup2(fd, 0); while(!0)printf("%c", getchar());' /dev/pts/XXX

# int dup2(int oldfd, int newfd)
# 複製した新しいfdを返す
ce 'int fd=open(argv[1], O_WRONLY); dup2(fd, STDOUT_FILENO); fprintf(stdout, "this is a test");' /dev/pts/XXX
# 指定した文字数だけ指定した出力先に出力する
ce 'int fd=open(argv[1], O_WRONLY); write(fd, "test is a test", 10);' /dev/pts/XXX

# 下記のコマンドを実行すると、別の端末の標準入力を受け取ることができる
# ただし、このコマンドでは、入力が分散されてしまう
# cat < /dev/pts/1

# The following example redirects messages from stderr to stdout.
# from new to old
# dup2(1, 2);

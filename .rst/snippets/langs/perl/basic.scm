(load-from-current-dirctory "include-perl.scm")

(ps "sort")
(run+ "@a=qw(abc b a z);say sort(@arr);")
(pw "sort関数は、2と11の場合、11が先になる")
(run+ "@a=qw(11 10 1 2);say for sort @a")
(run+ "@a=qw(11 10 1 2); @b=sort{$a<=>$b}@a; say qq/@b/")

(run+ "rand(10)")
(run+ "int(rand(10))")

;; use String::Random;
;; String::Random->new->randregex('[A-Za-z0-9]{32}');

mkdir("./lockdir", 0755)
rmdir("./lockdir")
chdir('/home/user1') or die $!;


 ;; || die "ディレクトリ生成失敗 : $!";
 ;; || die "ディレクトリ削除失敗 : $!";

    ;; opendir(DIR, "/home/user/public_html")
    ;; @file = readdir(DIR);
    ;; closedir(DIR);
    ;; for(@file){
    ;;    print "$_\n";
    ;; }

;; .. warning::
;;    ``print FH $line;`` ここの,はいらない

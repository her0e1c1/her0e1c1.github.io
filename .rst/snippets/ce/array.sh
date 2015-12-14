HERE=$(dirname $0)
cat <<EOS

=======
 Array 
=======

$(go <<EOG
 (define (run cmd)
   (p (sphinx-block (format "$ ce '~a'\n~a" cmd (run-ce cmd)) :code-block "sh")))

 (p "Declare")
 (run "int a[10];")
 (run "static int a[10];")

 (run "int a[] = {1,2,3};")
 (run "int a[] = {1,2,3}; int *b=a;")
 (p "However you can't assign a vector to a pointer directly.")
 (run "int *a  = {1,2,3};")

 (p "Initialize a 2D array")
 (run "int a[10][10] = {10}; p(\"%d\", a[0][0]);")

 (p "Initialize a 2D array")
 (run "int a[10][10] = {{ 0 }}; p(\"%d\", a[0][0]);")

 (p "valc. so you can allocate memroy dynamically even if it is an array")
 (run "int k=10; int a[k];")

 (p "But with static, an error occurs")
 (run "int k=10;static int a[k];")

 (p (sphinx-section "memset"))

 (p "Fill 0")
 (run "int a[10][10]; memset(a, 0, sizeof(a)); p(\"%d\", a[0][0]);")
 
 (p "Fill -1")
 (run "int a[10][10]; memset(a, -1, sizeof(a)); p(\"%d\", a[0][0]);")

 (p "Don't work because memset fills numbers but 0 or -1 at each byte")
 (run "int a[10][10]; memset(a, 1, sizeof(a)); p(\"%d\", a[0][0]);")
 (run "int a[10][10]; memset(a, 10, sizeof(a)); p(\"%d\", a[0][0]);")

;; # 16進数から2進数への変換は、f => 1111, 0 => 0000, 1 => 0001と考えるので
;; # 00000001が4回繰り返しコピーされていることがわかる
 (run "int i[1]; memset(i, 1, sizeof(int)); printf(\"%x\", i[0]);")

 (p "if gid (the first arg) exists, return its name")
 (run "p(\"%s\", group_from_gid(0, 0));")
 (p "if gid doesn't exists, return the number. the return type is not int but char*")
 (run "p(\"%s\", group_from_gid(123456, 0));")
 (p "Or just return NULL if the second argument is nonzero")
 (run "p(\"%s\", group_from_gid(123456, 1));")

 (p "Normalize path. I think return value is the same as a buff-stored value.")
 (run "char s[PATH_MAX]; p(\"%s\", realpath(\"/home/../home/././.\", s));")

 (p "printf doesn't output until it encounters newline. an error will occur because of referring null pointer")
 (run "char*a=NULL, b; p(\"this is NOT printed.\"); b=*a;")
 (run "char*a=NULL, b; p(\"this is printed.\"); fflush(stdout); b=*a;")

EOG
)

EOS

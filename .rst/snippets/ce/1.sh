HERE=$(dirname $0)
cat <<EOS

=============
 Array 
=============

$(go <<EOG
 (define (run cmd)
   (p (sphinx-block (format "$ ce '~a'\n~a" cmd (run-ce cmd)) :code-block "sh")))

 (p "Declare")
 (run "int a[10];")
 (run "static int a[10];")

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
 (run "int a[10][10]; memset(a, 0, sizeof(a)); p(\"%d\", a[0][0]);");
 
 (p "Fill -1")
 (run "int a[10][10]; memset(a, -1, sizeof(a)); p(\"%d\", a[0][0]);");

 (p "Don't work because memset fills numbers but 0 or -1 at each byte")
 (run "int a[10][10]; memset(a, 1, sizeof(a)); p(\"%d\", a[0][0]);");
 (run "int a[10][10]; memset(a, 10, sizeof(a)); p(\"%d\", a[0][0]);");

EOG
)


EOS

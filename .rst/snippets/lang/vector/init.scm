
(cpp "vector<int>v; P(v.empty())" :msg "Declare a variable but it's empty.")

(cpp "vector<int>* x =  {1,2,3};" :warn "pointerとして初期化できない")
(cpp "vector<int>* x = &{1,2,3};" :warn "pointerとして初期化できない")
(p "変数を介せばOK")
(cpp "vector<int> x = {1,2,3}; vector<int>* y = &x;")

(cpp "vector<int>v(3); PE(v)" :msg "Create a vector of [0, 0, 0] ")
(cpp "vector<int>v(3, 7); PE(v)")

(cpp "vector<int>v{1,2,3,4,5}; PE(v)")
(cpp "int a[]={1,2,3,4,5}; vector<int> v(a, a+5); PE(a)")

(p "10 * 10 vector")
(cpp "VI v1(3, 1); vector<vector<int>> v2(3, v1); PE2(v2)")
(cpp "vector<vector<int>> v2(3, vector<int>(3, 1)); PE2(v2)")


;; #define V(x, ...)                               \
;;   int __ ## x [] = {__VA_ARGS__};               \
;;   vector<int> x(__ ## x, __ ## x + SIZE(__ ## x))

;;   V(mv, 1, 2, 3, 4, 5);
;;   print(mv, "mv");
;; }

(zsh "typeset -a s; s=(1 2 3 4 1 2); echo $s")


(c "int a[10];")
(c "static int a[10];")
(c "int a[] = {1,2,3};")
(c "int a[] = {1,2,3}; int *b=a;")
(c "int *a  = {1,2,3};" :warn "However you can't assign a vector to a pointer directly.")

(p "Initialize a 2D array")
(c "int a[10][10] = {10}; p(\"%d\", a[0][0]);")

(p "Initialize a 2D array")
(c "int a[10][10] = {{ 0 }}; p(\"%d\", a[0][0]);")

(p "valc. so you can allocate memroy dynamically even if it is an array")
(c "int k=10; int a[k];")

(p "But with static, an error occurs")
(c "int k=10;static int a[k];")

(ps "Initialize")
(c "int i[30] = {0};")
(c "int i; for(int k=0; k<30; k++)i[k]=0;")
(c "int i[30]; memset(i, 0, sizeof(i));")

(template-map
 (cut c <> :str #t :msg "You need to initialize each item.")
 '("int c[range] = {0};"
"
int c[range];
for (int i = 0; i < range; i++) c[i] = 0;
"
   )
#!DOC EOS
void a(int range){
  REPLACE
}
int main() {a(10);}
EOS
)

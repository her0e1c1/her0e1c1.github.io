
(p "Declare a variable but it's empty.")
(run "cpe 'vector<int>v; P(v.empty())'")

(pw "pointerとして初期化できない")
(run+ "vector<int>* x =  {1,2,3};")
(run+ "vector<int>* x = &{1,2,3};")
(p "変数を介せばOK")
(run+  "vector<int> x = {1,2,3}; vector<int>* y = &x;")

(p "Create a vector of [0, 0, 0] ")
(run "cpe 'vector<int>v(3); PE(v)'")
(run "cpe 'vector<int>v(3, 7); PE(v)'")

(run "cpe 'vector<int>v{1,2,3,4,5}; PE(v)'")
(run "int a[] = {1, 2, 3, 4 ,5}; vector<int> v(a, a + 5); P(a)")

(p "10 * 10 vector")
(run "cpe 'VI v1(3, 1); vector<vector<int>> v2(3, v1); PE2(v2)'")
(run "cpe 'vector<vector<int>> v2(3, vector<int>(3, 1)); PE2(v2)'")


;; #define V(x, ...)                               \
;;   int __ ## x [] = {__VA_ARGS__};               \
;;   vector<int> x(__ ## x, __ ## x + SIZE(__ ## x))

;;   V(mv, 1, 2, 3, 4, 5);
;;   print(mv, "mv");
;; }

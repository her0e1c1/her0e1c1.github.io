
;; #include <iostream>

;; using namespace std;

;; /*
;; $ g++ factrial.cpp && ./a.out
;; fact(1)
;; => 1
;; fact(100)
;; => 9.33262e+157
;; fact(10000)
;; => inf
;; fact(1e+06)
;; [1]    55257 segmentation fault  ./a.out

;; # Make stack size infinite because initial stack size is about 8M
;; $ ulimit -s unlimited
;; */

;; double factrial(double n){
;;   if (n <= 1)
;;     return 1;
;;   else
;;     return n * factrial(n - 1);
;; }

;; int main(int argc, char* argv[]){
;;   int N = 1000000;
;;   for (double i = 1; i <= N; i *= 100){
;;     cout << "fact(" << i << ")" << endl;
;;     double res = factrial(i);
;;     cout << "=> " << res << endl;
;;   }
;; }


;; #include <iostream>
;; #include <bitset>
;; using namespace std;
;; void comb(int N, int K){
;; for(int mask=0; mask < (1<<N); mask++)
;;     if (__builtin_popcount(mask) == K)
;;       cout << bitset<4>(mask) << endl;
;; }
;; int main(){
;;   comb(4, 2);
;; }

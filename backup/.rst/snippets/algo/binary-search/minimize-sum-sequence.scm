
(p "ある配列をK個に区分したときの、区分配列のうち最大和の最小値を求める")

(cpp #!Q
#include "myutils.h"
bool f(int SUM, int K, vector<int> A) {
  int s = 0;
  int k = 0;
  for (int i = 0; i < A.size(); i++) {
    if (s + A[i] <= SUM) {
      s += A[i];
    } else {
      k++;
      s = A[i];
    }
    if (k == K) return false;
  }
  return true;
}
int main() {
  P(f(7, 3,{2, 1, 5, 1, 2, 2, 2}));
  P(f(6, 3,{2, 1, 5, 1, 2, 2, 2}));
  P(f(5, 3,{2, 1, 5, 1, 2, 2, 2}));
  P(f(1000, 1,{0, 1000, 0}));
}
Q :str #t :msg "[max(A), sum(A)]の範囲で2分探索することで、SUMの最小値がもとまる")

;; whileバージョン
;; bool f(int SUM, int K, vector<int> A) {
;;   int i = 0;
;;   int N = A.size();
;;   for (int k = 0; k < K; k++) {
;;     int s = 0;
;;     while (s <= SUM) {
;;       if (i == N) return true;
;;       if (s + A[i] > SUM) break;
;;       s += A[i];
;;       i++;
;;     }
;;   }
;;   if (i == N) return true;
;;   return false;
;; }

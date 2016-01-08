
(ghc #!Q
canAttack :: [Int] -> Int -> Bool
canAttack queens x = go queens 1 where
  go [] _ = False
  go (q:qs) n = q == x + n || q == x - n || go qs (n + 1)
solve :: Int -> [[Int]]
solve boardSize = go [] where
  go queens = if (length queens) == boardSize
              then [queens]
              else concatMap (go . flip (:) queens) $ filter f [0 .. (boardSize - 1)]
    where
      f x = not $ (elem x queens) || (canAttack queens x) 
main = print $ solve 4
Q :str #t)

;; // TODO: c++14にてautoで型の記述を減らす
;; #include "myutils.h"

;; // queensのデータの表現は、{0行目の列, 1行目の列,,, size-1行目の列}となる
;; // push_frontにしてschemeと表現を統一したほうがよいと思うが、push_frontはvectorには存在しない

;; bool canAttack(int x, vector<int> queens) {
;;   function <bool(int, int)> iter = [&] (int n, int row) {
;;     if (row >= 0) {
;;       int col = queens[row];
;;       // 斜め左、右にそれぞれ移動した場合に駒があるか？ (自分より下の行は考えない)
;;       if (x + n == col || x - n == col)
;;         return true;
;;       return iter(n + 1, row - 1);
;;     }
;;     return false;
;;   };
;;   return iter(1, queens.size() - 1);
;; }

;; vector<vector<int>> solveQueen(int boardSize) {
;;   auto iter = [&] (vector<int> queens) {
;;     // function <vector<vector<int>>(vector<int>)> iter = [&] (vector<int> queens) {
;;     // queensはk-1番目の行までは、条件を満たしている
;;     // ここではk行目だけを考える

;;     if (queens.size() == boardSize)
;;       return vector<vector<int>>(1, queens);

;;     vector<vector<int>> qss;
;;     for (int i = 0; i < boardSize; i++) {
;;       if (find(ALL(queens), i) == queens.end() && !canAttack(i, queens)) {
;;         vector<int> qs = queens;
;;         qs.push_back(i);
;;         vector<vector<int>> q = (vector<vector<int>>)iter(qs);
;;         qss.insert(qss.end(), ALL(q));
;;       }
;;     }
;;     return qss;
;;   };
;;   return iter(vector<int>());
;; }

;; int main() {
;;   vector<vector<int>> qss = solveQueen(4);
;;   REP(a, qss.size())
;;     PE(qss[a]);
;; }


; Queensのデータ構造は
; '(k-1行目の列, k-2行目,,, 1行目, 0行目)
; とする。理由は, k行目を加えるときに(cons k '(k-1までの結果)) が使えるため

; なお答えは board-size <= 3の場合は、存在しない


;; 特定の文字列をまとめて置換(入力少なめ)

;; testの網羅性をどう担保するか？
;; 全ての組み合わせを記述するのは、不可能
;; それぞれのテスト項目を洗い出して、それに関してのみ実施するべき、
;; ２つのことをまとめてテストするのもありかな。

;; 1 An項目のテストがあれば、それぞれ独立してテストする。
;; 2 組み合わせテストは、A1 * A2 * ... * Anとなるが、膨大の数になる
;;   そのため、nC2パターンまで実施することで押さえておく
;;   個の場合、A1*A2, A2*A3では見つからないバグが、A1*A2*A3でおこる可能性はある
;;   極力それぞれのテストの独立性を高めることが重要

;; 3 ランダムサンプリングもあるが、エッジケースをとらえられないので、あまり意味ない
;;   ハードコーディングせずに、ランダム値を100回繰り返すのは、有効かも（時間かかるが）

;; 4 範囲が有限数であれば、その範囲を全て網羅したテストを記述する
;;   ハードコーディングせずに、変数にする必要があるため、テストのテストをする必要がでてくるが

;; 5 ハードコーディングのメリットは、テストのテストを気にしなくてよいところ

;; 6 境界線チェックは必要
;; 7 ((f n) (if (= n 111) 'error 'ok) みたいな特別扱いの値はテストしにくい
;; 8 引数の範囲は押さえた方がよい
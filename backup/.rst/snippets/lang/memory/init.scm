
;; new/delete演算子の注意点

;; ++では通常、malloc関数（calloc、reallocも同様）および、free()巻数を使いません。
;; 理由は、malloc関数ではコンストラクタを呼び出すことができないからです。
;; 同時に、free関数では デストラクタが呼び出されません。
;; そのため、C++言語では、メモリの生成および消去にはnewとdeleteが用いられます。

;; classだけでなく、intのような基本データ型でも同様

;;   // newは、確保した領域のpointerを返す
;;   int* p = new int();
;;   *p = 1;
;;   printf("%d", *p);
;;   delete p;
;;   // new に失敗すると NULL が返ってくる。
;;   // 本来は、その例外処理を忘れないこと！

;;   // とくに以下の書き方をJavaはするので混同しないこと
;;   // int[] p = new int [10]; こっちはエラー
;;   int* p = new int [10];
;;   for (int i = 0; i < 10; i++)
;;     p[i] = i;
;;   delete [] p;  // []を忘れてもcomplie通るので注意

;;   // 以降動作未定義
;;   for (int i = 0; i < 10; i++)
;;     printf("%d", p[i]);

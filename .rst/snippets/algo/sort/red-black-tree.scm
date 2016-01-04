
================
 Red Black Tree
================

==========
 Property
==========
1. 色は赤と黒の２種類
2. 赤は必ず子供をもち、黒でないといけない
3. ROOTは黒
4. LEAFは、黒のNIL
5. ROOTからLEAFまでの黒の個数は、どの経路も同じ
6. 赤が２つ続いてはいけない
7. 黒は連続して繋がって良い
8. 新しいノードは赤として代入
9. rotateしても、経路における黒の個数は普遍

Insertは、基本binary treeと同じ。その後上記の制限をみたすように木構造を修正。
挿入は必ず赤で行う。

- 赤を黒に返ることは、2に反しない(ただし、黒経路数が１増える)
- ROOTが赤に更新されたとしても、最後に黒に修正してよい。
  なぜなら、2,5に反しないから。

- P/Uを黒、GPを赤としても、黒経路数は不変

挿入の前提は、挿入前の状態が平衡状態で制限を全て満たしている。
そのため、状態が決定している

1. 親が黒であれば、挿入はそこで終了.(黒経路数は不変)
2. 親と叔父が赤であれば、それぞれ黒にして、その親を赤にすることで、再帰状態
   - 叔父の子は黒NILだけ(初回)。
   - 黒NIL => 赤に置き換えたので経路数は変わっていない

3. 叔父が黒の場合、それは黒NIL

============
 references
============

- http://web.mit.edu/~emin/www.old/source_code/red_black_tree/index.html

(ps "isa")
(p "A is a Bとは、AはBのサブクラス(Bが親, Aが子)であることをいう。(つまり継承)")

(ps "has a")
(p "
A has a Bとは、Aの属性にBがあることをいう。(包含関係A-)B)
このとき、AはBに機能を委譲している。またBは集約と呼ぶ。
一般的には、親がB, 子がAとなる。
継承したくない場合には、委譲をするのも一つの手段。

メリット
- 必要な親クラスのメソッドを選択的に使用できる。 (継承だと、全て公開される。)

デメリット
- 記述量が多くなる。(継承は明示しない)

以下の多重度を考慮する必要がある。

0..1  無しか一つ
1     確実に一つ
0..* または *   ゼロ個以上
1..* 1個以上

0ということは、親なしで子供が存在できることを意味する。
")

(ps "static method")
(p"
- 属性の値を使用するものは、メソッドとして実装
- 属性の値を使用しないのであれば、静的なメソッドとして実装

pythonのstatic methodと通常関数の区別については、
サブクラスでオーバーライドしたい場合に、static methodを使用すると意図が明確になる

値を返さないメソッドは、副作用をもつ.
この副作用は、オブジェクトの属性に影響を与えるものになる(あるいはIOなどの処理)
")

(ps "difference between instance and object")
(p"
An object is an instance of a class.

結論
どちらも同じものとみなして良さそう。
")

(ps "setter/getter")
(p"
メリット
- setする前にバリデーションが可能
- get/setする前にログが可能
- set/get時の権限チェック
- 関数かすることで、引数に応じた処理が可能になり、柔軟性向上
- javaの慣習に従う
- カプセル化

デメット
- 単純なデータ構造には冗長すぎる
- 内部状態を渡すと、クラス外で状態が変更される危険性がある ::

     public class Store {
       private List<String> books = new ArrayList<String>();
       List<String> get_books(){
           return books;
       }
     }
")

(ps "AOP (Aspect Oriented Programming)")
(p "cross-cuttingするような機能を提供
ログなどを関数内に直接記述しないで、本体から分離するなど
")

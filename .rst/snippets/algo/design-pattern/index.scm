(p "
区分方法(生成・振る舞い・構造/Encapsulation, polymorphism, inheritance)
- 継承(クラスの関係)
- 委譲と多重度(クラスの関係)
- キャッシュ
- ポリモーフィズム（共通メソッド==同一視）
  - 振る舞い
  - データ生成
  - クラスの条件分岐(全て、１つ)
- インターフェイス(使い手側がどう見えるか)
  - 既存コード修正必要・修正不要
  - wrapper(同一視+機能追加、インターフェイス改善-引数)
  - 状態(mutable/imutable)
  - 条件分岐(client側で分岐?implementer側で分岐?)

親と子供達（委譲）に共通のメソッドを用意
- composite(親子同一視)

親達(委譲)に共通のメソッドを用意
- state(親の差し替え前提)
- strategy(behavior、インスタンス時のみに選択できるが、差し替えしない)
- bridge(structure、選択させない、差し替えしない)

直系先祖達(委譲)に対して共通のメソッドを用意
- decorator(親子同一視)
- Chain of Responsibility(条件分岐==クラスの選択)

子供達に対して共通のメソッドを用意
- observer(subjectの状態変更通知, 1:N?)
- command(interfaceと実装の分離。実装１つ、インターフェイス複数、N:Mの関係)

Treeに対する評価
- visitor(動的にメソッド切り替える)

Listに対する評価
- iterator

別クラスのメソッドを呼び出す(一人委譲の親の委譲あり、逆参照なし)
- adaptor(一つのクラスをラップして、使いやすいインターフェイスを提供)
- proxy(別クラスと同一視、別クラスとプロキシクラスに同じメソッドが必要)
- facade(複数のクラスをラップして、使いやすいインターフェイスを提供)

N:Nの関係をN:1にする
- mediator(多重度の修正)


継承した子供の共通メソッド(データ生成)
- factory method(単一クラス)
- abstract factory(複数クラス)


関数型としての比較
- strategy (関数オブジェクト)
- visitor (foldable)
- composit (recursive data)
")

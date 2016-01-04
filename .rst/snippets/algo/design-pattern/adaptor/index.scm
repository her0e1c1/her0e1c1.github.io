
(p"
target +method <- adapter
adapter <>-- adaptee

利用は、APIが決まっていてそれを変更できないときに使う。
今回の場合は、外部ライブラリなので、apiを追加・修正できない。

adaptorは、継承と委譲パターンがあるが委譲とする
redisのconnectionを毎回、クラスに渡していると、
よくやるパターンなどをconnectionの利用側で記述してしまう。

今回みたいに、よく使われるパターンはadaptor側で実装して
複数のクラスから共通に利用させるとよい。

Proxyパターンと似ているが
対象のクラスのメソッドは、interfaceを継承する必要はない
今回の場合では、connにflushというメソッドは不要
つまり、adapterとadapteeを同一視する必要はない
")


(sphinx-run-from-path "redis-adaptor.py")

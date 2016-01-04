
(p"
If it walks like a duck and quacks like a duck, it must be a duck.

javaのようにinterfaceを宣言しなくても、
同様のメソッドがあれば、同じような振る舞いを期待した実装をすること。
オブジェクト間に継承などの関係を一切もつ必要は無い。

読みやすい・安全ということではなく、柔軟であることが特徴
")

(py #!Q
class Duck(object):
    def sound(self):
        print("quack")


class Cat(object):
    def sound(self):
        print("myaa")


def main():
    for animal in [Duck(), Cat()]:
        animal.sound()  # ここで同じメソッド名という理由だけで、soundの呼び分けができる

if __name__ == "__main__":
    main()
Q :str #t)

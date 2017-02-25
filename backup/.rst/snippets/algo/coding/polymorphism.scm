(ps "polymorphism"
(p "
多様性の例

以下のように、型ごとに別名の関数を用意するのではなく
stringFromNumber(number)
stringFromDate(date)

オブジェクトのメソッドとして定義することで同名を利用する
string = date.toString()
string = number.toString()

これにより、型の違うオブジェクトでも、
インターフェイスが共通であれば、同様に利用できる。
def toList(strables):
    return [s.toString() for s in strables]

クラスを利用する側(クライアント側)のコードの再利用性を高める

javaのインターフェースもrubyのダッグタイピングもどちらも多様性をもつ
")

(ps "reflection")

(ps "replace if with class")
(p"
if文は、classで置き換えることができる
この場合、別の条件がでてきたときに、
新しいクラスを一つ用意すれば済む
(インスタンスの生成方法時は仕方が無い？)

クラスを作ることは、条件分岐することと同じ
")

(py #!Q
def say1(animal):
    if animal == "cat":
        print("myaa")
    elif animal == "duck":
        print("quack")

    # if ... とまた別の条件分岐が必要になったとき
    # polymorphismでは、animal.do_somethimg()で記述が終わるが
    # 条件を記述しないといけない
    # 条件がふえたときに、if文だと追加し忘れる可能性が高い
    # classにしておけば、必要なメソッドを実装すればよいので修正範囲が狭くなる

def say2(animal):
    # 共通のインターフェイスを利用して
    # 条件分岐をクラスに記述
    animal.say()

class Cat(object):
    def say(self):
        print("myaa")

class Duck(object):
    def say(self):
        print("quack")

def main():
    say1("cat")
    say1("duck")

    say2(Cat())
    say2(Duck())

if __name__ == "__main__":
    main()
Q :str #t)

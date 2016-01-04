
(p"
stateパターンは状態によって、呼び出すメソッドを変更させる

context <>-- state
context +method1
state +method1 <- state1
state +method1 <- state2
")

(java #!Q
interface State {
 public void hello();
}
class Fine implements State {
 public void hello() { System.out.println("Hello I'm file :D"); };
}
class Angry implements State {
 public void hello() { System.out.println("):"); };
}
class Human {
 private State state;
 Human(State s) { state = s; }
 public void hello() { state.hello(); };
}
class Main {
 public static void main (String[] args) {
  (new Human(new Fine())).hello();
  (new Human(new Angry())).hello();
 }
}
Q :str #t)

(ps "クラスの状態(Normal, Fast, Slow)に合わせてプレイヤーの移動速度が変わる")
(py #!Q
# URL: http://nekogata.hatenablog.com/entry/2013/02/09/233540

def add(p1, p2):
    x1, y1 = p1
    x2, y2 = p2
    return (x1 + x2, y1 + y2)

class Normal(object):
    def move(self, dx, dy):
        return (dx * 1, dy * 1)

class Fast(object):
    def move(self, dx, dy):
        return (dx * 2, dy * 2)

class Slow(object):
    def move(self, dx, dy):
        return (dx * 0.5, dy * 0.5)

class Player(object):

    def __init__(self):
        self.position = (0, 0)
        self.state = Normal()

    def change(self, state):
        self.state = state

    def up(self):
        self.move(1, 0)

    def down(self):
        self.move(-1, 0)

    def left(self):
        self.move(0, 1)

    def right(self):
        self.move(0, -1)

    def move(self, dx, dy):
        self.position = add(self.state.move(dx, dy), self.position)
        print("(%s, %s)" % self.position)

def main():
    p = Player()
    p.up()
    p.left()
    p.change(Fast())
    p.down()
    p.right()
    p.change(Slow())
    p.up()
    p.left()

if __name__ == "__main__":
    main()

Q :str #t)     

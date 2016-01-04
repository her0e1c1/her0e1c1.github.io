

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

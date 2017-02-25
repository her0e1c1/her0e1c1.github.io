
interface Acceptor {
    public void accept (final Visitor v);
}

// 冗長ではあるが、classを継承してまとめて記述はできない
// 型の整合性をとるために、それぞれのクラスでacceptを記述する必要あり
class A1 implements Acceptor {
    public void accept (Visitor v) {
        v.visit(this);
    }
}

class A2 implements Acceptor {
    public void accept (Visitor v) {
        v.visit(this);
    }
}

class Visitor {
    public void visit (A1 a) {
        System.out.println("visit A1");
    }

    public void visit (A2 a) {
        System.out.println("visit A2");
    }
}

public class DoubleDispatch {

    public static void main (String[] args) {
        System.out.println("create visitor");
        (new Visitor()).visit(new A1());
        (new Visitor()).visit(new A2());

        System.out.println("create acceptor");
        (new A1()).accept(new Visitor());
        (new A2()).accept(new Visitor());

        System.out.println("for each acceptor");
        // visitorパターンを使うとvisitの呼び出しを動的に決定できる
        for (Acceptor a: new Acceptor[] {new A1(), new A2(), new A1()}){
            a.accept(new Visitor());
            // (new Visitor()).visit(a); // compile error!
            }
    }
}
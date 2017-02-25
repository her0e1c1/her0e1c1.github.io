
/*
  strategy pattern

  lambda式で同様の機能を実現することが可能。
  bridge patternと同じ構造ではあるが、
  クラス設計ではなく、アルゴリズムの差し替えに重きがある。

 */

public abstract class Animal {

    public static void main (String[] args) {
        System.out.println("c1");
        Crow c1 = new Crow(new HighFlyable(), new SlowRunnable());
        c1.fly();
        c1.run();

        System.out.println("c2");
        Crow c2 = new Crow(new LowFlyable(), new SlowRunnable());
        c2.fly();
        c2.run();

        System.out.println("d1");
        Dog d1 = new Dog(new FastRunnable());
        d1.run();

        System.out.println("t1");
        Turtle t1 = new Turtle(new SlowRunnable());
        t1.run();
    }
}

// interfaceを使い機能の外だしをし、
// 別クラスに委譲し、機能を提供
interface Flyable {
    public void fly ();
}

class HighFlyable implements Flyable {
    public void fly () {
        System.out.println("fly high");
    }
}

class LowFlyable implements Flyable {
    public void fly () {
        System.out.println("fly low");
    }
}

interface Runnable {
    public void run ();
}

class FastRunnable implements Runnable {
    public void run () {
        System.out.println("run fast");
    }
}

class SlowRunnable implements Runnable {
    public void run () {
        System.out.println("run slow");
    }
}

class Crow extends Animal implements Flyable, Runnable {
    public Flyable flyable;
    public Runnable runnable;

    Crow (Flyable f, Runnable r) {
        flyable = f;
        runnable = r;
    }

    // おそらく委譲先を呼び出すメソッドを定義するくらいは
    // 冗長ではあるが、Animalで定義するよりかはマシ
    // DogなどはAnimalではあるが、Flyableの性質はないので
    // 委譲のためのメソッドは実装してよさそう。
    public void fly () {
        flyable.fly();
    }
    public void run () {
        runnable.run();
    }
}

class Dog extends Animal implements Runnable {
    Runnable runnable;
    Dog (Runnable r) {
        runnable = r;
    }
    public void run () {
        runnable.run();
    }
}

class Turtle extends Animal implements Runnable {
    Runnable runnable;
    Turtle (Runnable r) {
        runnable = r;
    }
    public void run () {
        runnable.run();
    }
}
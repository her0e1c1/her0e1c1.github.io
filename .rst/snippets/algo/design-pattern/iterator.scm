

(java #!Q
import java.util.*;
public class Main {
 public static void main (String[] args) {
  Pack p = new Pack();
  p.add(new Candy(100));
  p.add(new Candy(200));
  p.add(new Candy(300));
  Iter i = p.iter();
  while (i.hasNext()) {
   Candy c = i.next();
   System.out.println(c);
  }
 }
}

class Candy {
 private int price;
 Candy(int price) { this.price = price; }
 @Override
 public String toString() { return String.format("candy(%d)", price); };
}

class Pack {
 private LinkedList<Candy> pack = new LinkedList<Candy>();
 public void add(Candy c) { pack.add(c);}
 public Iter iter() { return new Iter(this.pack); }
}

class Iter {
 private LinkedList<Candy> pack;
 Iter(LinkedList<Candy> p) { this.pack = p; }
 Candy next() { return this.pack.pop(); }
 boolean hasNext() { return this.pack.size() == 0 ? false : true; }
}

Q :str #t)

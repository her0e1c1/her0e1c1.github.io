(p "
Component * --<> 1 Composite
Component + operation() <- Leaf 
Component + operation() <- Composite

Composite Patternでは、箱をその中身と同様に扱う。
今回はファイルシステムを例にするため,
箱がDirectoryで、中身がFileとする。(Directoryは箱と中身の両方の役割を担う)

このパターンが有効なのは、再帰構造をしたデータである。
TreeのNodeがDirectoryで、LeafがFileとなる。

このパターンで必要となるものは
親子共通メソッドとCompositeにインスタンスを格納する容器

木構造の例
ツリーの関係(Node/Leaf)
DOM(html)
Parent/Children

以下のようなクラス
   class Node:
       children = []
")

(java #!Q
import java.util.*;
interface EntryInterface {
 public String name = "";
 public void remove();
}
class Directory implements EntryInterface {
 public String name;
 Directory(String name) { this.name = name; }
 ArrayList<EntryInterface> entries = new ArrayList<>();
 public void add(EntryInterface e) { entries.add(e); }
 public void remove() {
  for (EntryInterface e: entries) { e.remove(); }
  System.out.printf("Remove a %s directory\n", name);
 }
}
class File implements EntryInterface {
 public String name;
 File(String name) { this.name = name; }
 public void remove() { System.out.printf("Remove a %s file\n", name); }
}
public class Main {
 public static void main (String[] args) {
  Directory root = new Directory("root");
  for (int i: Arrays.asList(1,2,3,4,5))
   root.add(new File(String.format("text%d.txt", i)));

  Directory sub = new Directory("sub dir");
  for (int i: Arrays.asList(1,2,3,4,5))
   sub.add(new File(String.format("music%d.mp3", i)));
  root.add(sub);

  System.out.println("Call a remove method of a root directory...");
  root.remove();
 }
}
Q :str #t)


;; # tag: parser, node

;; # 子供をもつときは、rootから再帰的に木構造を辿れる
;; # 親の参照しかないときは、rootには行き着くが、他の子供へは行けない


;; # 参照方向 子供 => 親
;; # parentだけ保持するだけでも木構造は表現できる
;; # sqlのforeign keyと同じ
;; class Node(object):

;;     def __init__(self, parent=None):
;;         # Noneの場合は、root
;;         self.parent = parent

;;     def child(self):
;;         return self.__class__(parent=self)

;;     def sibling(self):
;;         return self.parent.child()


;; # 参照方向 子供 <= 親
;; class Node1(object):

;;     def __init__(self):
;;         self.children = []

;;     def append(self, child):
;;         self.children.append(child)

;;     # 木構造を再帰的に辿る(composite's operation method)
;;     def iter(self):
;;         for child in self.children:
;;             child.iter()


;; # 参照方向 子供 <=> 親
;; class Node2(object):

;;     def __init__(self, parent=None):
;;         parent.append(self)  # 逆参照
;;         self.parent = parent
;;         self.children = []

;;     def append(self, child):
;;         self.children.append(child)


(p "if文を使うと冗長になりやすい場合は、配列を使うと簡潔になる
左右上下に動く物体の遷移先を計算するときなどに使える")

(cpp #!Q
#include <myutils.h>
void move(int *x, int *y, int d) {
 if (d == 0)
    *x += 1;
 else if (d == 1)
    *x -= 1;
 else if (d == 2)
    *y += 1;
 else
    *y -= 1;
}
int main() {
 int x=0,y=0;
 move(&x,&y,0);
 cout << x << ", " << y <<endl;
}
Q :str #t)

(cpp #!Q
#include <myutils.h>
void move(int *x, int *y, int d) {
  int dx[] = {1, -1, 0,  0};
  int dy[] = {0,  0, 1, -1};
  *x += dx[d]; 
  *y += dy[d];
}
int main() {
 int x=0,y=0;
 move(&x,&y,0);
 cout << x << ", " << y <<endl;
}
Q :str #t)

(p "methodにして、関数名で分岐させるのが、読みやすい")
(cpp #!Q
#include <myutils.h>
class O {
private:
 int x,y;
public:
 O() {this->x = this->y = 0;}
 void up() {this->x += 1;}  
 void down() {this->x -= 1;}  
 void left() {this->y += 1;}  
 void right() {this->y -= 1;}  
 friend ostream& operator<<(ostream& os, const O& o);
};         
ostream& operator<<(ostream& os, const O& o) {
 os << o.x << ", " << o.y;
 return os;
}
int main() {
 O o; o.up();
 cout << o <<endl;
}
Q :str #t)

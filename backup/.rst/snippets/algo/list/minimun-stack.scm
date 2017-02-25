
(p"
10 3 7 1 11 0
10 3 1 0と最小値をstackしていく
min O(1)となる
")

(cpp #!Q
#include <myutils.h>
class MinStack : public stack<int>{
private:
  stack<int> cache;

public:
  MinStack(){};
  void push(int);
  int pop(void);
  int getMin(void);
};

void MinStack::push(int value) {
  int min = getMin();
  if (min > value){
    cache.push(value);
  }
  stack::push(value);
}

int MinStack::pop() {
  int value = stack::top();
  stack::pop();
  if (getMin() == value)
    cache.pop();
  return value;
}

int MinStack::getMin() {
  if (cache.empty())
    return 1 << 30;
  return cache.top();
}

int main() {
  MinStack s;
  for (int i: {10, 3, 7, 1, 11, 0})
    s.push(i);

  while(! s.empty()){
    cout << s.getMin() << endl;
    s.pop();
  }
}
Q :str #t)

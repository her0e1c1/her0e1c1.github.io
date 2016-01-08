(ps "return true if src and dst are connected")

(p "if you want to get the shortest path, use BFS not DFS")

(cpp #!Q
#include <myutils.h>
class Graph {
public:
  vector<vector<int>> g;
  int N;
  Graph(vector<int> x, vector<int> y, int N) {
    this->N = N;
    g.resize(N);
    for(int i = 0; i < x.size(); i++) {
      int xi = x[i];
      int yi = y[i];
      g[xi].push_back(yi);
    }
  }
  bool search(int src, int dst){
    vector<int> q;
    q.push_back(src);
    vector<bool> visited(N, false);
    while (!q.empty()) {
      int n = q.back();
      q.pop_back();
      visited[n] = true;
      for (int i = 0; i < g[n].size(); i++) {
        int next = g[n][i];
        if (next == dst)
          return true;
        if (!visited[next]) {
          q.push_back(next);
        }
      }
    }
    return false;
  }
};
int main(){
  Graph g({0, 1, 2, 3, 3, 4, 5},
          {1, 3, 1, 0, 5, 3, 2},
          6);
  cout << g.search(0, 2) << endl;
  cout << g.search(0, 4) << endl;
}
Q :str #t)

(ps "get a path from src to dst in a graph")

(p "最短経路を、一つ前のノードをリスト(previous)で持つのは、読みにくい。
クラスを用意して、親ノードを保持するデータ構造の方が、読みやすい。")

(cpp #!Q
#include <myutils.h>
class Graph {
public:
  vector<vector<int>> g;
  int N;
  Graph(vector<int> x, vector<int> y, int N) {
    this->N = N;
    g.resize(N);
    for(int i = 0; i < x.size(); i++) {
      int xi = x[i];
      int yi = y[i];
      g[xi].push_back(yi);
    }
  }
  vector<int> search(int src, int dst){
    vector<int> q;
    q.push_back(src);
    vector<bool> visited(N, false);
    vector<int> previous(N, -1);
    while (!q.empty()) {
      int n = q.back();
      q.pop_back();
      visited[n] = true;
      for (int i = 0; i < g[n].size(); i++) {
        int next = g[n][i];
        if (!visited[next]) {
          q.push_back(next);
          previous[next] = n;
        }
        if (next == dst) {
          vector<int>p(1, dst);
          int i = previous[dst];
          while (i != -1) {
            p.push_back(i);
            i = previous[i];
          }
          return p;
        }
      }
    }
    return vector<int>();
  }
};
int main(){
  Graph g({0, 1, 2, 3, 3, 4, 5},
          {1, 3, 1, 0, 5, 3, 2},
          6);
  PE(g.search(0, 2));  
  PE(g.search(0, 4));
}
Q :str #t)

(p "DFSを実行し、行き先がなくなったものから順に、リストに格納")

(pw "you can't sort a cyclic graph!!!")

(cpp #!Q
#include <myutils.h>
vector<int> sort(Graph &g) {
 vector<bool> visited(g.N, false);
 vector<int> sorted;
 function <void(int)>dfs = [&](int node) {
  visited[node] = true;
  for(int next: g.E[node])
    if (!visited[next])
      dfs(next);
  sorted.push_back(node);
 };
 for (int node: g.nodes())
  if (!visited[node])
   dfs(node);
 return sorted;
}
int main(){
  Graph g({0, 2, 3, 3, 4, 5},
          {1, 1, 0, 5, 3, 2},
          6);
  P(g);
  vector<int> ret = sort(g);
  PE(ret);
}
Q :str #t)

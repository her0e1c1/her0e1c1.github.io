#include "myutils.h"

// 9.7

int main() {
  // vector<pair<int, int>> people = {
  //   {20, 10},
  //   {50, 20},
  //   {20, 10},
  //   {30, 50},
  //   {10, 30},
  //   {100, 10},
  //   {20, 15},
  //   {10, 10},
  //   {40, 10},
  //   {200, 40},
  //   {20, 100},
  //   {15, 30},
  //   {60, 10}
  // };

  vector<pair<int, int>> people = {
    {65, 100}, {70, 150}, {56, 90}, {75, 190}, {60, 95}, {68, 110}
  };

  sort(ALL(people));
  REP(it, people.size())
    cout << it << " " << people[it].first << ", " << people[it].second << endl;

  function <vector<int>(int)> dfs = [&] (int depth) {
    if (depth == people.size())
      return vector<int>();
    vector<int> numbers;
    int height = people[depth].first;
    int weight = people[depth].second;
    for (int i = depth + 1; i < people.size(); i++) {
      int h = people[i].first;
      int w = people[i].second;
      if (h > height && w > weight) {
        vector<int> n = dfs(i);
        if (n.size() > numbers.size())
          numbers = n;
      }
    }
    numbers.push_back(depth);
    return numbers;
  };
  PE(dfs(0));
}



  vector<pair<int, int>> v = {{1, -1}, {-2, 5}, {3, 10}};

  // WARN: 同じ表現でも初期化できるが、forと組み合わせできない
  // for(pair<int, int> x: {{1,2}, {2,5}});

  // 参照方法
  EACH(it, v)
    cout << it->first << ", " << it->second << endl;

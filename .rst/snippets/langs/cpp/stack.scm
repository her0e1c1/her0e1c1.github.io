



  stack<int> s1, s2;
  for (int i = 1; i <= 10; i++){
    s1.push(i);
  }
  P(s1.top());
  PS(s1);
  // Not return value
  s1.pop();
  P(s1.size());
  P(s1.empty());

  // You can't access with a index
  // s1[0];

  // You don't use begin method
  // s1.begin();

  // Convert stack to vector
  //int* end = &s1.top() + 1;
  P(&s1.top());
  P(&s1.top() + 1);
  int* end = &s1.top() + 1;
  int* begin = end - s1.size();
  vector<int> v1(begin, end);
  E(v1);

  P(max(true, false));

  // If you pop a empty stack, it will be broken
  P(s2.empty());
  P(s2.size());
  cout << "s2.pop();" << endl;
  s2.pop();
  P(s2.size());



  set<int> s;
  
  s.insert(1);
  s.insert(2);
  s.insert(3);
  s.insert(1);  // Not inserted
  print_set(s, "s");

  int a[] = {0, 1, 2, 3};
  set<int> s1(a, a + 4);

  string str = "abede";
  set<char> s2(str.begin(), str.end());
  
}

void find(){
  char str[] = "abcde";
  set<char> s(str, str + 5);
  if (s.find('b') != s.end()){
     cout << "having b" << endl;
   }

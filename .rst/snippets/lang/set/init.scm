
(run "python -c 'print(set([1,1,1,2,2,3]))'")

(cpp "set<int> s; s.insert(1); s.insert(2); s.insert(3); s.insert(1); EACHP(s)")
(cpp "int a[]={0,1,2,3}; set<int> s(a, a+4); EACHP(s)")
(cpp "string str = \"abede\"; set<char> s(str.begin(), str.end()); EACHP(s)")

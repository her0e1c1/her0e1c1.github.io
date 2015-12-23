

(pw "pop_back/pop_frontの戻り値はvoid")
(p "pop from back")
(cpp "list<int> l{1,2,3}; while(!l.empty()){P(l.back()); l.pop_back();}")
(cpp "list<int> l{1,2,3}; while(!l.empty()){P(l.front()); l.pop_front();}")

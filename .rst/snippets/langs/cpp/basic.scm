(load-from-current-dirctory "include-cpp.scm")

(ps "hello world")
(run+ "[](){ cout << \"hello world\" << endl; }();")
(run+ "[]{ cout << \"hello world\" << endl; }();")

(run+ "cout << bitset<8>(10) << endl;")

(p "
cout stands for console output

likewise,
cin  is console input
cerr is console error
")

(run+ "cout << \"str\";")
(run+ "cout << flush;")
(run+ "cout << endl;")
(p "Don't worry about type like int, string, or bool etc.")
(run+ "cout << \"bool: true \" << true << \", false \" << false << endl;")


(p "
bool型があります。
#define true 1
#define false 0
")

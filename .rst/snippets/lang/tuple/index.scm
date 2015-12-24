(p "multiple values")

(cpp "pair<int, string> pis(10,\"str\"); cout << pis.first << \" \" << pis.second << endl;")

(gosh (receive (a b) (values 1 2) (+ a b)))


(p "引数が@_に格納されてるので、そのどれかを取り出す感じ")
(perl "sub {print $_[rand @_] for 1 .. 255}->(\"a\" .. \"z\", 0 .. 9, \"A\" .. \"Z\")")
(perl "sub {print \"@_\"}->(\"a\" .. \"z\", 0 .. 9, \"A\" .. \"Z\")")

(cpp "[](){ cout << \"hello world\" << endl; }();")
(cpp "[]{ cout << \"hello world\" << endl; }();")

(zsh "(){echo 'hello'}" :msg "関数定義しただけでなく、実行もされる")

(sh "a(){ echo \"$1\";}; a 'hello world'"
    :warn "sh/bashは、匿名関数使えない. 仕方がないので1回呼ぶので対応")


(ps "cpp")
(p"
- [] don't capure anything

Bellow you can use closure

- [&] capture-by-reference
- [=] capture-by-value (copy)
")

(cpp "function <int(int)> f=[&](int n){ return n == 1 ? 1 : f(n-1) * n;}; P(f(5))" :msg "need ; after }")
(cpp "function <int(int)> f=[](int n){ return n == 1 ? 1 : f(n-1) * n;}; P(f(5))" :warn "[]だと、{}の外側のfを参照できない")

(cpp "function <void(int)>f=[&](int &n){P(n)};f(1);" :warn "compile error if using reference")
(cpp "function <void(int)>f=[&](const int &n){P(n)};f(1);" :msg "use const to avoid an error")
(cpp "function <void(int)>f=[&](int n){P(n)};f(1);")

(cpp "int N=1;[](){N=2;}();P(N)" :warn "you can't modify N")
(cpp "int N=1;[&](){N=2;}();P(N)" :msg "use reference and modify N")
(cpp "int N=1;[=](){N=2;}();P(N)" :warn "imuutable in lambda")
(cpp "int N=1;[=]()mutable{N=2;}();P(N)" :msg "copy and modify N")

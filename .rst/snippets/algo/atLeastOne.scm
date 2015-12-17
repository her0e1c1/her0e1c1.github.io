(load-from-current-dirctory "include.scm")

(p (sphinx-section "配列の要素が、少なくとも1回、それぞれ出現したか?"))

(define code #!HEREDOCUMENT EOS

int f(vector<int> A) {
  int N = A.size();
  // c[0] is dummy
  vector<int>c(X+1, 0);
  int leaves = 0;
  for (int i = 0; i < N; i++) {
      int pos = A[i];
      if (pos > X) continue;
      c[pos]++;
      if (c[pos] == 1)
         leaves++;  // first found
      if (leaves == X)
         return i;
  }
  return -1;
}
EOS
)

; (p code)

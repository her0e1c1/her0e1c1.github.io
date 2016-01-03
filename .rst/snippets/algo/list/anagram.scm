(p "anagramは、ある文字列の文字の順番を入れ替えて作成した別の文字列を作る")
(p "Statue of Liberty = built to stay free")
(ptodo "文字列の配列を受け取り、anagram同士が隣に並ぶようにソート")

(c #!DOC EOS
#include <stdio.h>

int anagram(char* p, char* q) {
  // 256文字までと仮定
  char counter[256] = {0};
  int pl, ql;
  pl = ql = 0;

  // pにおけるそれぞれの文字数をカウント
  // Also get the length of p here
  for (char* it = p; *it; it++) {
    char c = *it - 'a';
    counter[c]++;
    pl++;
  }

  // qで上で取得したカウンタを減算
  // 別文字が存在、あるいは
  for (char* it = q; *it; it++) {
    char c = *it - 'a';
    counter[c]--;
    ql++;
    if (counter[c] < 0)
      return 0;
  }

  // p, qの長さが等しいも満たす必要あり
  if (pl == ql)
    return 1;
  return 0;
}

int main() {
  printf("%d\n", anagram("abacb", "aacbb"));  // 1
  printf("%d\n", anagram("abacb", "abcde"));  // 0
  printf("%d\n", anagram("abacb", "aabb"));   // 0
  printf("%d\n", anagram("abacb", "aabbcc")); // 0
}
EOS
:str #t)

(gosh #!Q
(define (anagram? p q)
  (equal? (sort p) (sort q)))
(print (anagram? "ababc" "cbbaa"))
(print (anagram? "ababc" "abcde"))
(print (anagram? "ababc" "cbbaaa"))
(print (anagram? "ababc" "caaa"))
Q :str #t)

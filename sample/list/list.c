#include <stdio.h>
#include <linkedList.h>

// ORDER: O(n)

int elem(int value, node_t* head) {
  node_t *current = head;
  while (current) {
    if (current->value == value)
      return 1;
    current = current->next;
  }
  return 0;
}

int main() {
  node_t* head = inits(6, 1, 2, 3, 4, 5, 6);
  printf("%d\n", elem(1, head));
  printf("%d\n", elem(-1, head));
}

// IMPLEMENT: reverse
#include <stdio.h>

// ORDER: ? O(n^2)
// \0の一つ前を探すのにn
// 先頭と末尾をswapするのにn/2

// MEMORY: small O(n)

/*
 *sが空文字でないなら、
 一つ先が'\0'になるようにpointerを進めること
 sとeを入れ替えることでreverseを実現

 偶数・奇数で中心の文字を入れ替えるかどうかの判断が必要になるが
 s == eの場合が奇数のときに起こるがこれは、交換してもしなくても結果的にはよい
 結局入れ替える条件は、s < eになる
 */

void swap(char* a, char* b) { char t = *a; *a = *b; *b = t; }

// MEMO:
char* reverse(char* s) {
  if (*s == '\0') return s;
  char *head = s;
  char *e = s;
  while (*(e + 1)) e++;
  while (s < e) swap(s++, e--);
  return head;
}

int main() {
  // WARN: "文字列"の書き換えは禁止されてる！
  // char* s = "blah blah";  // error
  char s1[] = "";
  char s2[] = "abcde";
  printf("%s\n", reverse(s1));
  printf("%s\n", reverse(s2));
}

#include <stdio.h>

// MEMO:
char* unique(char* str) {
  char *dst = str;
  for (char *i = str; *i ;i++) {
    char *j;
    for (j = str; j < dst; j++) {
      if (*j == *i)
        break;
    }
    if (j == dst)  // breakしなかった場合
      *dst++ = *i;
  }
  *dst = '\0';
  return str;
}

int main() {
  char s1[] = "abcaabc";
  printf("%s\n", unique(s1));

  char s2[] = "aabbcc";
  printf("%s\n", unique(s2));

  char s3[] = "";
  printf("%s\n", unique(s3));

  char s4[] = "abc";
  printf("%s\n", unique(s4));

  char s5[] = "aaaaaa";
  printf("%s\n", unique(s5));

  char s6[] = "1122aabbgghhiijjkkllmmoopp";
  printf("%s\n", unique(s6));
}

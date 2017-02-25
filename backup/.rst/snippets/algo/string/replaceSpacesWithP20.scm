(p"
文字列の長さを増やす場合(減らすときは問題ない)
mallocで新しくメモリを確保する必要がある
'\0'の領域を確保し忘れないこと
ORDER: O(n) = 2 * 文字列の長さ
")

(c #!DOC EOS
#include <myc.h>
char* replaceSpacesWithP20(char* s) {
  int length = 0;
  for (char* it = s; *it; it++) {
    if (*it == ' ')
      length += length + 3;
    else
      length++;
  }
  char* new = malloc(sizeof(char) * length + 1);
  char* head = new;
  for (char* it = s; *it; it++) {
    if (*it == ' ') {
      *new++ = '%';
      *new++ = '2';
      *new++ = '0';
    } else
      *new++ = *it;
  }
  *new = '\0';
  return head;
}

int main() {
  printf("%s\n", replaceSpacesWithP20("ab cd ef g"));
  printf("%s\n", replaceSpacesWithP20(""));
  printf("%s\n", replaceSpacesWithP20("   "));
  printf("%s\n", replaceSpacesWithP20("a   a   a   "));
  printf("%s\n", replaceSpacesWithP20("abcde"));
}
EOS
:str #t)

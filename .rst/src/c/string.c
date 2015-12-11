
#include "mystring.h"

int main() {
  char *s[] = {
    "abcde",
    "eeee",
    "ababab",
  };
  printf("%s\n", s_join(s, '-', 3));
  printf("%d\n", s_strcmp("abc", "ab"));
  printf("%d\n", s_strcmp("a", "ab"));
  printf("%d\n", s_strcmp("abc", "abc"));
  printf("%d\n", s_strcmp("abc", "efg"));
}

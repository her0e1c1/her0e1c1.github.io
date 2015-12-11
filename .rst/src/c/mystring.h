
// 文字列の探索

// KMP/BM

// find
// unique
// last but k
// reverse words
// split
// join
// format
// replace

#include <stdio.h>
#include <stdlib.h>

char *s_reverse(char *str) {
  if (*str == '\0')
    return str;

  char *first = str;
  char *last = str;
  while (*last)
    last++;
  last--;
  while (first < last) {
    char tmp = *first;
    *first = *last;
    *last = tmp;
    first++;
    last--;
  }
  return str;
}

char *s_reverse_word(char *str) {

}

char *s_strip(char *str) {
  while (*str == ' ')
    str++;
  char *last = str;
  while (*last)
    last++;
  last--;  // go backword from '\0'
  while (*last == ' ')
    last--;
  *++last = '\0';
  return str;
}

int s_strcmp(char *p, char *q) {
  while (*p && *q) {
    if (*p < *q)
      return -1;
    else if (*p > *q)
      return 1;
    p++;
    q++;
  }
  if (*p)
    return 1;  // q is longer
  else if (*q)
    return -1;  // p is longer
  else
    return 0; // same length
}

int s_strlen(char *str) {
  char *last = str;
  while (*last) last++;
  return last - str;
}

char *s_join(char **str, char delim, int length) {
  int sum = 0;
  for (int i = 0; i < length; i++)
    sum += s_strlen(str[i]);
  sum += length;  // delim * (length - 1) + '\0'

  char *p, *q;
  p = q = (char *)malloc(sizeof(char) * sum);
  for (int i = 0; i < length; i++) {
    for (char *s = str[i]; *s; s++)
      *q++ = *s;
    *q++ = delim;
  }
  *--q = '\0';
  return p;
}

char *s_lower(char *str) {
  for (char *c = str; *c; c++) {
    if ('A' <= *c && *c <= 'Z') {
      *c = 'a' + (*c - 'A');
    }
  }
  return str;
}

char *s_upper(char *str) {
  for (char *c = str; *c; c++) {
    if ('a' <= *c && *c <= 'z') {
      *c = 'A' + (*c - 'a');
    }
  }
  return str;
}

int s_is_substring(char *ps, char *qs) {
  char *p, *q;
  for (char *s = ps; *s; s++) {
    char *p = s;
    char *q = qs;
    while (*p && *q)
      if (*p == *q) {
        p++;
        q++;
      } else
        break;
    if (*q == '\0')
      return 1;
  }
  return -1;
}

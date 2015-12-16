
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

// search/insert/update/delete/next/previous/
// min/max/append/

// unsorted list
struct _list {
  int data;
  struct _list *next;
};

typedef struct _list list_t;

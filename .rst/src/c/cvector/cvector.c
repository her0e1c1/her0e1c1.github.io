#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <assert.h>

#define X(x) printf("%s => %s\n", #x, x ? "ok" : "no");
#define cv_data_type int

// deleteat insertat
// copy, reverse, append, count, find

struct _cvector {
  size_t size;
  size_t capacity;
  cv_data_type *data;
  // int cmp;
};

typedef struct _cvector cvector_t;

size_t round2up(size_t size) {
  assert ((size << 1) > size);  // check overflow
  size_t n = 1;
  while (n <= size)
    n <<= 1;
  return n;
}

cvector_t *cv_init(size_t size) {
  cvector_t *cv = malloc(sizeof(cvector_t));
  size_t capacity = round2up(size);
  cv_data_type *data = malloc(sizeof(cv_data_type) * capacity);
  if (cv == NULL || data == NULL) {
    printf("Out of memory");
    exit(1);
  }
  cv->data = data;
  cv->size = 0;
  cv->capacity = capacity;
  return cv;
}

cvector_t *cv_inits(size_t size, ...) {
  cvector_t *cv = cv_init(size);
  va_list va;
  va_start(va, size);
  for (int i = 0; i < size; i++)
    cv->data[i] = va_arg(va, cv_data_type);
  va_end(va);
  return cv;
}

void cv_display(cvector_t *cv) {
  printf("<cvector> ");
  if (cv == NULL) {
    printf("NULL\n");
  } else if (cv->size == 0) {
    printf("EMPTY\n");
  } else {
    printf("%zu/%zu = ", cv->size, cv->capacity);
    for (int i = 0; i < cv->size - 1; i++) {
      // TODO; print depending on type
      printf("%d, ", cv->data[i]);
    }
      printf("%d\n", cv->data[cv->size - 1]);
  }
}

int cv_equal(cvector_t *cv1, cvector_t *cv2) {
  if (cv1 == NULL)
    return -1;
  else if (cv2 == NULL)
    return 1;
  // TODO: NULL && NULL => 0
  if (cv1->size != cv2->size)
    return cv1->size < cv2->size ? -1 : 1;
  for (int i = 0; i < cv1->size; i++) {
    if (cv1->data[i] != cv2->data[i])
      return cv1->data[i] < cv2->data[i] ? -1 : 1;
  }
  return 0;
}

cv_data_type cv_index_at(cvector_t *cv, int index) {
  if (0 <= index && index < cv->size)
    return cv->data[index];
  printf("Out of index");
  exit(1);
}

cvector_t *cv_push_back(cvector_t *cv, cv_data_type data) {
  cv->data[cv->size] = data;
  cv->size++;
  if (cv->size == cv->capacity) {
    cv->capacity = round2up(cv->size);
    cv->data = realloc(cv->data, sizeof(cv_data_type) * cv->capacity);
    if (cv->data == NULL) exit(1);
  }
  return cv;
}

cv_data_type cv_pop_back(cvector_t *cv) {
  cv_data_type data = cv->data[cv->size];
  cv->size--;
  size_t smaller = cv->capacity / 2;
  if (cv->size == smaller) {
    cv->capacity = smaller;
    cv->data = realloc(cv->data, sizeof(cv_data_type) * smaller);
    if (cv->data == NULL) exit(1);
  }
  return data;
}

int main() {
  /* cv_display(cv_inits(3,1,2,3)); */
  /* cv_display(cv_inits(4,1,2,3,4)); */
  /* cv_display(cv_inits(5,1,2,3,4,5)); */
  // X(cv_equal(cv_inits(3,1,2,3), cv_inits(3,1,2,3)) == 0);
  // cvector_t *cv = cv_inits(5,1,2,3,4,5);

  cvector_t *cv = cv_init(1);
  for (int i = 0; i < (1<<4)-1; i++) {
    cv_push_back(cv, i);
    printf("%d, ", cv_index_at(cv, i));
  }
  printf("\n");
    cv_display(cv);
  for (int i = 0; i < (1<<4)-1; i++) {
    cv_pop_back(cv);
    cv_display(cv);
  }
}

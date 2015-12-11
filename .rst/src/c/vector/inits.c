#include "../utils.h"
#include "../vector.c"

int main() {
  vector_t *v = inits(3, 1, 2, 3);
  TEST(v->size == 3);
  TEST(v->data[0] == 1);
  TEST(v->data[1] == 2);
  TEST(v->data[2] == 3);
}

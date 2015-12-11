#include "../utils.h"
#include "../vector.c"

int main() {
  TEST(equal(inits(3,1,2,3), inits(3,1,2,3)));
  TEST(!equal(inits(3,1,2,3), inits(2,1,2)));
}

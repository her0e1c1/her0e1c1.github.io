
==============
 Realloc Cost
==============



.. code-block:: c
   

    #include "stdio.h"
    #include "stdlib.h"
    #include "string.h"
    
    typedef long long ll;
    
    int main(int argc, char **argv) {
      ll size = 1UL << (argc > 1 ? atoi(argv[1]) : 5);
    
      ll *p = (ll *)malloc(sizeof(ll) * size);
      if (p == NULL) {
        printf("Out of memory\n");
        exit(1);
      }
    
      if (argc <= 2) {
        printf("Nothing to do\n");
      } else if (strcmp(argv[2], "ONE") == 0) {
        // Get all the memory at one time
        for(ll i = 0; i < size; i++) p[i] = i;
      } else if (strcmp(argv[2], "EACH") == 0) {
        // Get sizeof(int) each time
        for(ll i = 0; i < size; i++) {
          p = (ll *)realloc(p, sizeof(ll) * (i + 1));
          p[i] = i;
        }
      }
    }
    
 

::

    # time => 0.057627(sec)
    clang reallocCost.c && ./a.out 5 ONE
 

::

    # time => 0.053298(sec)
    clang reallocCost.c && ./a.out 5 EACH


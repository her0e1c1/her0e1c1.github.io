

// reallocはO(n)じゃないの?
// realloc use copy 
ce 'char*p=malloc(10);memcpy(p, "abcd", 5); printf("%s", realloc(p, 5));'
ce 'char*p=malloc(10);memcpy(p, "abcd", 5); if (realloc(p, 5) != p)printf("not same");'

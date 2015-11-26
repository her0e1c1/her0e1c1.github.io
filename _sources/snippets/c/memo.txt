// reallocはO(n)じゃないの?

// mallocも0で初期化されているみたい
ce 'char*p=malloc(1 << 10); REP(i,10)if(p[i])printf("1");' 
ce 'char*a; __typeof(a) i = "abc";'

// fill 0
ce 'char*p=calloc(10, sizeof(char)); printf("%s", p);'

// 失敗
ce 'char*p=malloc(1 << 31); printf("A%sA",p);'

// realloc use copy 
ce 'char*p=malloc(10);memcpy(p, "abcd", 5); printf("%s", realloc(p, 5));'
ce 'char*p=malloc(10);memcpy(p, "abcd", 5); if (realloc(p, 5) != p)printf("not same");'

// 'printf("%lud",ULONG_MAX);'

//
ce 'printf("%d",ULONG_MAX == (0UL - 1));'

// 8byte == 64bit(111..1) 2^63 + 2^62 + ... + 2^0 == 2^64 - 1
ce 'printf("%lu",sizeof(ULONG_MAX));'

// 2byte
ce 'printf("%lu",sizeof(short int));'
ce 'printf("%lu",sizeof(short));'

//-2 ^ 15 + 1
ce 'printf("%d",SHRT_MIN);'

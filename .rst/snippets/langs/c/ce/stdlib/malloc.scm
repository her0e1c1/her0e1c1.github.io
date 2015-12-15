
// mallocも0で初期化されているみたい
ce 'char*p=malloc(1 << 10); REP(i,10)if(p[i])printf("1");' 
ce 'char*a; __typeof(a) i = "abc";'

// 失敗
ce 'char*p=malloc(1 << 31); printf("A%sA",p);'

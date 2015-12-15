(p "Get a size of an array")
(run "#define SIZE(x) (sizeof(x) / sizeof(x[0]))\n int a[] = {1,2,3}; p(\"%d\", SIZE(a));")

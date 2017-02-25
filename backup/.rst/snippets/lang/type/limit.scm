
(c "p(\"%lud\", ULONG_MAX);")
(c "p(\"%lu\",sizeof(ULONG_MAX));")
(c "p(\"%d\", ULONG_MAX == (0UL - 1));" :msg "8byte == 64bit(111..1) 2^63 + 2^62 + ... + 2^0 == 2^64 - 1")
(c "p(\"%d\",SHRT_MIN);")

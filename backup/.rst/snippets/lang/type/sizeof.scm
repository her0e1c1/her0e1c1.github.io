
(let1 types '(char short "short int" int size_t void*
              long float double "long float" "long long" "long double" "double double")
(dolist (t (map x->string types))
(c #"p(\"%zu\", sizeof(~t));" :msg "with %zu print as unsigned decimal")))

(c "int b[10]; p(\"%zu\", sizeof(b));" :msg "sizeof gets all the memory size, not the length of an array")

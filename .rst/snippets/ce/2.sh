HERE=$(dirname $0)
cat <<EOS
=======
 macro
======= 

$(go <<EOG
 (define (run cmd . args)
   (p (sphinx-block (format "$ ce '~a' ~a\n~a"
                            cmd
                            (if (null? args) "" (string-join (map x->string args) " "))
                            (apply run-ce cmd args))
                    :code-block "sh")))

 (p "Get a size of an array")
 (run "#define SIZE(x) (sizeof(x) / sizeof(x[0]))\n int a[] = {1,2,3}; p(\"%d\", SIZE(a));")

 (p "argc")
 (run "p(\"%d\", argc);" ' 1 2 3 4 5)

 (p "argv is a list of argument strings. they are stored in memory. the last item is NULL")
 (p "you can also say like char** is [String]")
 (run "while(*argv){p(\"%s \", *argv); argv++;}" 1 2 3)

 (p "Increment pointer. ++ and +=1 are no different. btw argv[0] is exec path.")
 (run "argv += 1; p(\"%s\", *argv);" "first")

 (p "Get the last item")
 (run "p(\"%s\", argv[argc - 1]);" "first" "secomd" "last")

 (p "Get values of evriron")
 (run "char**e=environ;while(*e){if(!strcmp(*e, \"USER=me\"))p(\"%s\", *e); e++;}")

 (p "if adding to the length of the string, you always refer '\0'")
 (run "char *s=\"abc\", *t; t = s + strlen(s); if(!*t) p(\"NULL\");")



EOG
)

EOS

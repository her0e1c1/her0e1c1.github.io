
(node "P(process.argv)" :argv "1 2 3")
(py "P(argv)" :argv "1 2 3")
(ruby "p ARGV" :argv "1 2 3")
(perl "say for @ARGV" :argv "1 2 3")

(c "p(\"%d\", argc);"  :argv "1 2 3 4 5")
(c "while(*argv){p(\"%s \", *argv); argv++;}"
   :argv "1 2 3"
   :msg "argv is a list of argument strings. they are stored in memory. the last item is NULL.
you can also say like char** is [String]")

(c "argv += 1; p(\"%s\", *argv);"
   :argv "first"
   :argv "Increment pointer. ++ and +=1 are no different. btw argv[0] is exec path.")

(c "p(\"%s\", argv[argc - 1]);"
   :argv "first secomd last"
   :msg "Get the last item")

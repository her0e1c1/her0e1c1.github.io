
(p (sphinx-section "fflush"))
(pw "printf doesn't output until it encounters newline. an error will occur because of referring null pointer")
(c "char*a=NULL, b; p(\"this is NOT printed.\"); b=*a;")
(c "char*a=NULL, b; p(\"this is printed.\"); fflush(stdout); b=*a;")

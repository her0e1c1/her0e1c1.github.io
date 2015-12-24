
(perl "say __LINE__\nsay __LINE__")

(c #!DOC EOS
#include <stdio.h>
int main(){printf("%s", __LINE__);}
EOS
:str #t)

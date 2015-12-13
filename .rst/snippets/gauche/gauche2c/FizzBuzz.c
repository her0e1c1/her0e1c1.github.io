
#line 1 "FizzBuzz.scm"
#include <stdio.h>

#line 3 "FizzBuzz.scm"
 int main(int argc,char** argv){{
#line 4 "FizzBuzz.scm"
{int i=0;int cise__789=30;for (; (i)<(cise__789); (i)++){
switch (((i)+(1))%(15)) {
case 0 : {printf("FizzBuzz\n");
#line 614 "/usr/local/share/gauche-0.9/0.9.4/lib/gauche/cgen/cise.scm"
break;}
#line 7 "FizzBuzz.scm"
case 3 : case 6 : case 9 : case 12 : {printf("Fizz\n");
#line 614 "/usr/local/share/gauche-0.9/0.9.4/lib/gauche/cgen/cise.scm"
break;}
#line 8 "FizzBuzz.scm"
case 5 : case 10 : {printf("Buzz\n");
#line 614 "/usr/local/share/gauche-0.9/0.9.4/lib/gauche/cgen/cise.scm"
break;}default: {
#line 9 "FizzBuzz.scm"
printf("%d\n",(i)+(1));
#line 614 "/usr/local/share/gauche-0.9/0.9.4/lib/gauche/cgen/cise.scm"
break;}}}}
#line 10 "FizzBuzz.scm"
return (0);}}

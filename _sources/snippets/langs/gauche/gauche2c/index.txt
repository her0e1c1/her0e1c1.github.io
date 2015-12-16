=============
 Gauche To C
=============


using CiSE
==========

::

    gosh translate.scm -i FizzBuzz.scm -o FizzBuzz.c
 
.. code-block:: scm
   

    (.include <stdio.h>)
    
    (define-cfn main (argc::int argv::char**) ::int
      (dotimes (i 30)
               (case (% (+ i 1) 15)
                 ((0) (printf "FizzBuzz\n"))
                 ((3 6 9 12) (printf "Fizz\n"))
                 ((5 10) (printf "Buzz\n"))
                 (else (printf "%d\n" (+ i 1)))))
      (return 0))
    
 
.. code-block:: scheme
   

    (use gauche.cgen)
    (use gauche.cgen.cise)
    (use gauche.parseopt)
    
    (define (main args)
      (let-args (cdr args)
                ((infile "i=s" #f)
                 (outfile "o=s" #f))
                (unless (and infile outfile)
                        (display #`"usage: gosh ,(car args) -i 'input-file' -o 'output-file'\n")
                        (exit -1))
                (call-with-input-file infile
                  (^ (in)
                     (call-with-output-file outfile
                       (^ (out)
                          (cise-translate in out)))))))
    

Generate C
==========
The comand creates a translated .c file.

.. code-block:: c
   

    
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
    

So you can run it.

::

    1
    2
    Fizz
    4
    Buzz
    Fizz
    7
    8
    Fizz
    Buzz
    11
    Fizz
    13
    14
    FizzBuzz
    16
    17
    Fizz
    19
    Buzz
    Fizz
    22
    23
    Fizz
    Buzz
    26
    Fizz
    28
    29
    FizzBuzz


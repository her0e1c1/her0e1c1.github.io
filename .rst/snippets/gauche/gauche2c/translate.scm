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

#!/usr/bin/env gosh

(define (import path_or_dir)
  (cond ((file-is-directory? path_or_dir)
         (sphinx-scm->rst (filter file-is-regular? (glob #"~|path_or_dir|/*.scm"))
                          #"~|path_or_dir|/index.rst"
                          :header (sphinx-section #"~|path_or_dir|")))
        (else (sphinx-scm->rst path_or_dir))))

(define (main args)
  (define dirname (sys-dirname (car args)))
  (let-args (cdr args)
            ((verbose     "v|verbose")
             (outfile     "o|outfile=s")
             (debug-level "d|debug-level=i" 0)
             . restargs
             )
            (if (null? restargs)
                (map sphinx-scm->rst (glob #"~|dirname|/*"))
                (map import restargs)))
  0)

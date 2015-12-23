#!/usr/bin/env gosh

(define (import path_or_dir :key (f #f))
  (cond ((file-is-directory? path_or_dir)
         (let1 path #"~|path_or_dir|/index.rst"
               (if (or f (not (file-exists? path_or_dir)))
                   (sphinx-scm->rst (filter file-is-regular? (glob #"~|path_or_dir|/*.scm"))
                                    path
                                    :header (sphinx-section #"~|path_or_dir|"))
                   (print #"SKIP: ~path already exists"))))
        ((file-is-regular? path_or_dir)
         (sphinx-scm->rst path_or_dir))
        (else (print #"SKIP: ~path_or_dir"))))

(define (main args)
  (define dirname (sys-dirname (car args)))
  (let-args (cdr args)
            ((f "f|force" #f)
             (outfile     "o|outfile=s")
             . restargs
             )
            (if (null? restargs)
                (map sphinx-scm->rst (glob #"~|dirname|/*"))
                (map (cut import <> :f f) restargs)))
  0)

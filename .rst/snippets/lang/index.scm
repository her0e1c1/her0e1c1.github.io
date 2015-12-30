#!/usr/bin/env gosh

(define quiet (make-parameter #f))

(define (qprint msg)
  (if (not (quiet)) (print msg)))

(define (import path_or_dir :key (f #f) (only-directory #f))
  (cond ((file-is-directory? path_or_dir) (sphinx-create-index-in-directory path_or_dir))
        ((and (not only-directory) (file-is-regular? path_or_dir) (#/\.scm/ path_or_dir))
         (sphinx-scm->rst path_or_dir))
        (else (qprint #"SKIP: ~path_or_dir"))))

(define (main args)
  (define dirname (sys-dirname (car args)))
  (let-args (cdr args)
            ((f "f|force" #f)
             (only-directory "d|directory" #f)
             (q "q|quiet" #f)
             . restargs
             )
            (parameterize
             ((quiet q))
             (if (null? restargs)
                 (map sphinx-scm->rst (glob #"~|dirname|/*"))
                 (map (cut import <> :f f :only-directory only-directory) restargs))))
  0)

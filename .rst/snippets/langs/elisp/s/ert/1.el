
;;; how to test emacs lisp codes
(require 'ert)

(ert-deftest sample()
  (should (eq 1 1)))

(ert-deftest test-divide-by-zero()
  (should-error (/ 1 0)
                :type 'arith-error))

; To test function sample, type `'M-x ert RET`'
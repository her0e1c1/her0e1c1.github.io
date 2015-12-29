
(emacs (progn (require 'ert) (ert-deftest sample() (should (eq 1 1))))
       :msg "To test function sample, type `'M-x ert RET`'")
(emacs (progn (require 'ert) (ert-deftest test-divide-by-zero() (should-error (/ 1 0) :type 'arith-error))))

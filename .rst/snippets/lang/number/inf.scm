
(node "a = 1/0;" :warn "Not an error")
(gosh (> +inf.0 1 0 -1 -inf.0))

;; inf = float("inf")
;; inf > 2 ** 100  # True
;; inf == 2 * inf + inf  # True


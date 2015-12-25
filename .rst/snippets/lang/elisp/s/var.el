
(multiple-value-bind
    (q r)
    (truncate* 10 3)
    (format "商 %s, 余り %s" q r))
; => "商 3, 余り 1"


(gosh (begin (p 1) (close-port (current-output-port))))
(gosh (begin (close-port (current-output-port)) (p 1))
      :warn "after closing the port, you can't print to stdout")

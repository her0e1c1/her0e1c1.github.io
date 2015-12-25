
(run "perl -E '$_=\"/home\"; say if -d'")

(zsh "echo /bin(/)")
(zsh "echo /bin/sh(/)" :warn "error")
(zsh "echo /bin/sh(N/)" :msg "ignore an error. return empty string")

(zsh "echo ~/.emacs.d(N/)" :warn "not following a symbol link so empty string")
(zsh "echo ~/.emacs.d(N-/)" :msg "this is recommended")

(gosh (file-is-directory? "."))

(load-from-current-dirctory "include-sh.scm")

(ps "case")

(run "case 'apple' in a*) echo 'starts with a';; esac")
(run "case 'apple' in a*) echo 'starts with a';; esac")
(p "? is any one char")
(run "case 'Xapple' in ?a*) echo 'starts with a';; esac")
(run "case '' in '') echo 'empty string';; esac")
(run "case 'banana' in apple|banana) echo 'I want banana';; esac")

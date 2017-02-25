
(sh "case 'apple' in a*) echo 'starts with a';; esac")
(sh "case 'apple' in a*) echo 'starts with a';; esac")

(p "? is any one char")
(sh "case 'Xapple' in ?a*) echo 'starts with a';; esac")
(sh "case '' in '') echo 'empty string';; esac")
(sh "case 'banana' in apple|banana) echo 'I want banana';; esac")

(emacs (pcase 1 (1 "one") (_ "else")))
(emacs (pcase 2 (1 "one") (_ "else")))

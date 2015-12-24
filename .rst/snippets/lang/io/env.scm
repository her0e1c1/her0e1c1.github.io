
(perl "say for split \":\", $ENV{PATH}")
(c "char**e=environ;while(*e){if(!strcmp(*e, \"USER=me\"))p(\"%s\", *e); e++;}")
(c "p(\"%s\", getenv(\"USER\"));")
(c "p(\"%s\", getenv(\"user\"));" :msg "NULL if the name doesn't exist.")

(gosh (sys-getenv "HOME"))
(gosh (sys-getenv "HOM"))

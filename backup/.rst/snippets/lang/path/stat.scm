
(ps "mount info")
(c "struct statfs s; statfs(\"/home\", &s); p(\"%s\", s.f_mntonname);")

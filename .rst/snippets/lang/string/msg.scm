
(ps "strerror")
(c "ps(strerror(1));")

(ps "strmode")
;# stat.st_modeを文字列で表示. \0を含めて11文字 (12?)
;# S_IRWXUは、RWX全てのUSR権限なので、読み込み・書き込み・実行の3つの和
(c "char s[12]; strmode(S_IRWXU | S_IWGRP, s); ps(s);")
(c "char s[12]; strmode(S_IRWXU | S_IWGRP, s); ps(s[11]==0? \"NULL\":\"NO\");")

(ps "group_from_gid")
(c "p(\"%s\", group_from_gid(0, 0));" :msg "if gid (the first arg) exists, return its name")
(c "p(\"%s\", group_from_gid(123456, 0));"
   :msg "if gid doesn't exists, return the number. the return type is not int but char*")
(c "p(\"%s\", group_from_gid(123456, 1));"
   :msg "Or just return NULL if the second argument is nonzero")

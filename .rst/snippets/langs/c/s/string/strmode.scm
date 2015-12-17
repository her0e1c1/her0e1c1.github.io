(load-from-current-dirctory "include.scm")

(p (sphinx-section "strmode"))
;# stat.st_modeを文字列で表示. \0を含めて11文字 (12?)
;# S_IRWXUは、RWX全てのUSR権限なので、読み込み・書き込み・実行の3つの和
(ce "char s[12]; strmode(S_IRWXU | S_IWGRP, s); ps(s);")
(ce "char s[12]; strmode(S_IRWXU | S_IWGRP, s); ps(s[11]==0? \"NULL\":\"NO\");")

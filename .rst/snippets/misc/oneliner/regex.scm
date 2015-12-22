(load-from-current-dirctory "include.scm")


(run "curl yahoo.co.jp |perl -nlE 's#(?<=href=)([\"''])/aiuie/(?=\1)#${1}{{ ''index'') }}#; say'")
(run "echo abc | perl -nlE 'say if /(\"([\\].|[^\\\"])*\")/'")

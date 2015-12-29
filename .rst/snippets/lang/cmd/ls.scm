
;; opendir(DIR, "/home/user/public_html")
;; @file = readdir(DIR);
;; closedir(DIR);
;; for(@file){
;;    print "$_\n";
;; }

(emacs (f-files ".") :msg "current files")
(emacs (f-directories ".") :msg "current files")

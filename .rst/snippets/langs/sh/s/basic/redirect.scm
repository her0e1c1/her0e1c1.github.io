(p"
;`/usr/src/usr.sbin/bsdinstall/scripts/hostname`

;; exec 3>&1
;; HOSTNAME=`dialog --backtitle 'FreeBSD Installer' --title 'Set Hostname' --nocancel --inputbox msg 0 0 $(hostname) 2>&1 1>&3`
;; exec 3>&-
")

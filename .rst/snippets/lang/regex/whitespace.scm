

;; import re
;; # WARN: \sは、全角スペースにマッチしない
;; re.match(r'\s', u"　")
;; re.match(ur'\s', u"　")
    
;; # WARN: 全角同士をマッチするにはuをつけること
;; re.match(r'　', u"　")
;; re.match(ur'　', u"　")

;; # UNICODEフラグをつけると、\sが全角にマッチ 
;; re.match(r'\s', u"　", re.UNICODE)
;; re.match(ur'\s', u"　", re.UNICODE)


(run "perl -pE 's/\r\n/\n/' << EOS
aaa
bbb
ccc
EOS"
     :warn "Don't use -l option, which chomps \"\n\" , \"\r\n\" or \"\r\"")

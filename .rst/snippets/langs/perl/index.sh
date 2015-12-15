HERE=$(dirname $0)
# cat <<'EOS'
cat <<EOS

# With -0 option delimiter is NULL
# (With -0777 you can't use any option delimiter)

# 警告を出力
perl -we 'print @a'
# Name "main::a" used only once: possible typo at -e line 1.

# $"
# This is a "@array" delimiter
perl -E '$"=" - "; @a=1..5; say "@a"'

# Don't use double quote which extend $ in sh or escape it
perl -e "\$a=1; print \$a"

$(go << EOG
 (p "'\$HERE'")
 ;; (sys-system "echo `echo 1`")
 ;; ; (define cmd "echo \`perl -E 'say \"HOGE\" x 10' \`")
 ;; (define cmd "echo \$(perl -E 'say \"HOGE\" x 10')")
 ;; (p cmd)
 ;; (flush)
 ;; (sys-system cmd)
EOG
)

EOS

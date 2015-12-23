# -f をつけて、全更新も可能
# index.scmをloadしないようにしている
cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

=========
Languages
=========

$(gosh index.scm -q `perl -E 'for(glob("*")){say if -d}'`)
$(goshe "(sphinx-toctree-directory)")


EOS

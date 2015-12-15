cd $(dirname $0) > /dev/null 2>&1
STRINGS=$(ls string/*.scm | perl -pE 's/(.*)/"\\$1"/')
cat <<EOS

========
 String
========

.. contents::

$(go <<EOG
 (load-from-current-dirctory "include.scm")
 (include+ ($STRINGS))
EOG
)

EOS

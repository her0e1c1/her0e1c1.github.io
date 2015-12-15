HERE=$(dirname $0) && cat <<EOS

======
 Perl
======

$(go "$HERE/index.scm")

EOS

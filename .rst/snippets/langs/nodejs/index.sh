HERE=$(dirname $0)
cat <<EOS

=======
Node.js
=======

npm:

- browserify
- jquery

$(go <<EOG
 (current-directory "$HERE")

EOG
)

EOS

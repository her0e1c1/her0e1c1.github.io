## rm
# rm -fr .
# find . -depth |perl -nle 'unlink or rmdir'
# find dir -type f -print0 | perl -l0ne unlink


# # Remove untracked files
# git st| perl -anlE '$_=$F[1]; unlink if -e'


# # Remove untracked files
# hg st . |perl -anlE '$F[0] =~ /^\?/ and unlink $F[1]'
# hg st . |ruby -anle '$F[0].match(/^\?/) and File.delete $F[1]'
# hg st . |grep "^\?" |cut -d " " -f 2 |xargs rm


# # rm recursively with find
# find . -delete
# rm `find .`
# find . -exec "rm {}" +
# find . | xargs rm


(emacs (f-delete "./test.txt"))

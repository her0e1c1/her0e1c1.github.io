
(run "find ./ -print0 | perl -MFile::Copy -MFile::Basename -l0ne 'move($_, \"/path/to/\" . basename($_)'"
     :msg "ファイルシステムをまたいでmove")

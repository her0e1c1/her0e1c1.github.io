
ruby -r tmpdir -e 'p Dir.mktmpdir do |d| puts end'  # "/tmp/d20150516-10476-pixcro"
ruby -r tmpdir -e 'p Dir.tmpdir'  # /tmp

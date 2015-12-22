
# 破壊的
ruby -e 'a="abc"; a << "efg"; puts a'
ruby -e 'puts "abc".concat("efg")'  # << と同じ


(node "\"abc\" + \"efg\"")

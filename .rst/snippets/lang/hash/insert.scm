
(cpp "map<string, int>m={{\"a\", 1}}; m.insert(map<string,int>::value_type(\"b\", 2)); P(m[\"b\"])")
(cpp "map<string, int>m={{\"a\", 1}}; m.insert(make_pair(\"b\", 2)); P(m[\"b\"])")

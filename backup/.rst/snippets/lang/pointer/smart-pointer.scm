
(cpp "unique_ptr<int> i(new int(123)); P(*i.get())"
     :msg "変数のスコープを出る時に，内部がnullでなければdelete")

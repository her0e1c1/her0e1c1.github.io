

(run "python -c 'import itertools as i; from collections import OrderedDict; print(OrderedDict([(pid, list(gen)) for pid, gen in i.groupby([1,1,1,2,2,3])]))'")

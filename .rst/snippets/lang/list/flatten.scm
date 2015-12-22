
(run "python -c 'from functools import reduce; flatten=lambda i:reduce(lambda a,b:a+(flatten(b)if hasattr(b,'__iter__')else[b]),i,[]); print(flatten([[1,2,3], 4, [5, [6], 7]]))'")

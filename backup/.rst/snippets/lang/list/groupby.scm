
(run "python -c 'import itertools as i; print(list(list(l) for _, l in i.groupby([1,1,1,2,2,3])))'")

(py #!Q
entries = [(3,1), (1,2), (2,1), (1,1),(2,3)]
entries.sort()
groupby = itertools.groupby(entries, key=lambda x: x[0])
def groups():
    key, entries = groupby.next()
    for key in [1,2,3]:
        if key == key:
            yield key, entries
            try:
                key, entries = groupby.next()
            except StopIteration:
                continue
        else:
            yield key, []
for key, entries in groups():
    print("%s => %s" % (key, list(entries)))
Q)

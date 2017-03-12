
a = ["cb", "abc", "a", "bb", "bac", "ca", "d", "cba", "bc", "acb"]


def cmp(x, y):
    if x < y:
        return -1
    elif x > y:
        return 1
    else:
        return 0

print(sorted(a, cmp=cmp))

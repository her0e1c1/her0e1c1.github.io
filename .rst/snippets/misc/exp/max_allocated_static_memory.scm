
(p"
Run the code like below, and examine max size of memory you can allocate
# > echo 'int a[100]; int main(){}' | clang -xc - -o /dev/null
# My local allocates 2305843009213693952 = (2 ** 62) - 1 at best
")

(py #!Q
import os

max_size = 2 ** 64
SOURCE = """
int a[%sUL];
int main() {}
"""

def to_human(num):
    for i, unit in enumerate(["", "K", "M", "G", "T", "P", "Z"]):
        min = 2 ** (i * 10)
        max = 2 ** ((i + 1) * 10)
        if min <= num < max:
            return "%s %s bite (= %s)" % (num // min, unit, num)
    else:
        return "%s bite" % num

def binary_search(max_size):
    lo = 0
    hi = max_size
    while lo + 1 < hi:
        mid = lo + (hi - lo) // 2
        s = SOURCE % mid
        cmd = "echo '%s' | clang -xc - -o /dev/null 2> /dev/null " % s
        if os.system(cmd) == 0:
            lo = mid
        else:
            hi = mid

    return lo

ans = binary_search(max_size)
print("Run the last command:")
print(SOURCE % ans)
if max_size > ans:
    print("You can allocate %s size of memory" % to_human(ans))
else:
    print("You can allocate more %s size of memory" % to_human(max_size))
Q :str #t)

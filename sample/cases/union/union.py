

# MEMO:
# A $cup B = A $cup (B $setminus A)
def f(A, B):
    C = []
    for x in A + B:
        if x not in C:
            C.append(x)
    return C
print(f([1, 2, 3, 4, 5], [1, 3, 5, 7, 9]))  # O(N^2)
print(set([1, 2, 3, 4, 5]) | set([1, 3, 5, 7, 9]))

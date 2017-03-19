

# MEMO: :Q:not(AandB)
# (A $cup B) - (A $cap B)  # 全体を決める必要あり
def f(A, B):
    return (set(A) | set(B)) - (set(A) & set(B))
print(f([1, 2, 3, 4, 5], [1, 3, 5, 7, 9]))  # O(N^2)

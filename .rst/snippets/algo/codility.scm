
#|
- https://codility.com/programmers/

TapeEquilibrium

  int abs(int x) {
  return x < 0 ? -x : x;
  }

  int solution(vector<int> &A) {
// write your code in C++11
int N = A.size();
int SUM = 0;
for (int i = 0; i < N; i++)
SUM += A[i];

int mi = -1;  // min index
int ms = abs(SUM);
for (int i = 0; i < N; i++) {
SUM -= 2 * A[i];
int s0 = abs(SUM);
if (s0 < ms) {
ms = s0;
mi = i;
}
}
return ms;
}


MaxCounters

vector<int> solution(int N, vector<int> &A) {
    int M = A.size();
    vector<int>c(N, 0);
    int ma = 0;
    int base = 0;
    for (int i = 0; i < M; i++) {
        int a = A[i]-1;
        if (a == N) {
              base = ma;
        } else {
            int b = c[a];
            if (b < base) {
                c[a] = base + 1;
            } else {
                c[a] = b + 1;
            }
            if (ma < c[a]) {
                ma = c[a];
            }
        }
    }
    for (int i = 0; i < N; i++) {
        if (c[i] < base)
          c[i] = base;
    }
    return c;
}
|#

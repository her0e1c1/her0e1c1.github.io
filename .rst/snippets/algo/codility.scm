
#|
- https://codility.com/programmers/

NumberOfDiscIntersections
(生存区間の分析?らしい, 後回し)

int solution(string &S) {
    vector<char> stack;

    for (int i = 0; i < S.size(); i++) {
        char c = S[i];
        if (c == '(' || c == '{' || c == '[') {
            stack.push_back(c);
        } else {
            if (stack.empty()) return 0;
            char p = stack.back();
            stack.pop_back();
            if (!((p == '(' && c == ')' )
                ||(p == '{' && c == '}' )
                ||(p == '[' && c == ']' )))
                return 0;
        }
    }
    return stack.empty() ? 1 : 0;
}



PassingCars (prefix sum/scanイマイチ理解できていない(M(1)にしたい))
int solution(vector<int> &A) {
    // write your code in C++11
    int N = A.size();
    vector<int> S(N+1, 0);
    int ans = 0;
    // A[i] == 1のときは、passingしない
    for (int i = N; i >=1; i--) {
        S[i-1] = S[i] + A[i-1];
    }
    
    for (int i = 0; i < N; i++) {
        if (A[i] == 0) {
         ans += S[i];
        }        
        if (ans > 1000000000)return -1;
    }
        

    return ans;
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


// NumberSolitaire
// 最大で6進む(NILがないからMINがやりずらい)
// 必ずゴールまで行く必要があるので、1進める必要あり(maを設定)

int MIN = -1 << 31;
int N;
vector<int> MEMO, AA;

int dfs(int depth) {
    if (MEMO[depth] != MIN)
        return MEMO[depth];

    if (depth == N-1)
        return AA[depth];
    // you can go one ahead
    int ma = dfs(depth + 1);
    int d = N - depth;
    if (d > 6) d = 6;
    for (int i = 2; i <= d ; i++) {
        int next = depth + i;
        if (next > N-1) continue;
        int r = dfs(next);
        if (r > ma)
            ma = r;
    }
    return MEMO[depth] = ma + AA[depth];
}

- https://codility.com/demo/results/trainingQGMGT9-RFD/
|#


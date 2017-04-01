package main

// 自己参照テーブルに使えそう
// 素集合をまとめる手法と要素がどの集合にあるか判定する手法に対して効率の良いデータ構造
// ack関数の逆関数の計算量らしい?(log2N)
// http://judge.u-aizu.ac.jp/onlinejudge/commentary.jsp?id=DSL_1_A


// MEMO: :Q:UnionFindのデータ構造
type UnionFind struct {
    Data []int  // 親を参照 (自分自身を参照している場合はRoot)
    Rank []int  // node数
}
func NewUnionFind(size int) *UnionFind {
    d := make([]int, size)
    r := make([]int, size)
    for i := 0; i < size; i++ {
        d[i] = i
        r[i] = 1
    }
    return &UnionFind{Data: d, Rank: r}
}


// MEMO:
func (uf *UnionFind) FindRoot(node int) int {
    if node != uf.Data[node] {
        uf.Data[node] = uf.FindRoot(uf.Data[node])
    }
    return uf.Data[node]
}

// MEMO:
func (uf *UnionFind) IsSame(a, b int) bool {
    return uf.FindRoot(a) == uf.FindRoot(b)
}

// MEMO:
func (uf *UnionFind) Union(a, b int) {
    a2 := uf.FindRoot(a)
    b2 := uf.FindRoot(b)
    if a2 == b2 {
        return
    } else if uf.Rank[a2] >= uf.Rank[b2] {
        uf.Data[b2] = a2
        uf.Rank[a2] += uf.Rank[b2]
    } else {
        uf.Data[a2] = b2
        uf.Rank[b2] += uf.Rank[a2]
    }
}

func main() {
    
}

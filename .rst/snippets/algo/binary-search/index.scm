
(ps "基本的な考え方")

;; (p "中点を取る際に、以下の２通りが考えられる(k $ge 0)")
;; (math "
;; high & = & low + 2k
;; high & = & low + 2k + 1
;; ")

;; (p "中点について")
;; (math "
;; mid & = & (low + high) / 2
;; ")

(math "
区間[low, high]を探索

中点を取る際に、以下の２通りが考えられる(k $ge 0)
high & = & low + 2k
high & = & low + 2k + 1

中点について
mid & = & (low + high) / 2
より、いずれの場合も、以下となる
mid & = & low + k

midが解でない場合は、区間を狭める必要がある. 
midは解ではないので、区間に含めない.

以下の範囲に狭めて探索を続ける
区間[low, mid - 1] (midよりも左側)
区間[mid + 1, high] (else)
")

;; 区間の幅は、以下のいずれか
;; (high - low + 1) = 2k + 1
;; (high - low + 1) = 2k + 1 + 1

(ps "終了条件をlow<highにすることの問題点")
(p "
k=0のとき、以下のいずれかとなる

- high = low (探索終了)
- high = low + 1 (ループ続ける)

しかし、ループを続けても、ともに終了条件となる

- [low, low+1] => [low+1, low+1] (右側探索)
- [low, low+1] => [low, low-1] (左側探索)

双方の場合、mid = lowなので、lowの探索はするが、low+1の探索はしない.
つまり、low<highの終了条件の場合、[low, low+1)の範囲しか探索しない.
")
(ptodo "ここから、1bit目が0のもの全てが探索されないといいたい")


(ps "midで更新することの問題点")
(p "
k = 0 かつ、終了条件がlow<=high のとき、mid = lowなので、

右側探索で更新する時、mid+1せず、midで更新すると、以下のように無限ループになる.

- [low, low]   => 右側探索 => [mid, low]   = [low, low]
- [low, low+1] => 右側探索 => [mid, low+1] = [low, low+1]

左側探索で更新する時、mid-1せず、midで更新すると、同様に無限ループになる.

- [low, low]   => 左側探索 => [low, mid] = [low, low]
- [low, low+1] => 左側探索 => [low, mid] = [low, low]

つまり、解ではないことが判明したmidを区間に含めないように、mid+1, mid-1して区間を狭める必要がある。
")

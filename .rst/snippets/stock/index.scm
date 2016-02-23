cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

=======
 Stock
=======

$(goshe '(sphinx-create-index-in-directory (glob "*")) ""')
$(goshe '(print (sphinx-toctree-directory. (glob "*")))')

EOS

LINKS (株の入門)
- http://www.miller.co.jp/index.html#levelupArea
- http://www.sevendata.co.jp/knowhow_index.html
- https://www.gaitameonline.com/academy_chart.jsp
- http://kabu.com/investment/guide/technical/default.html

株サイト
- http://kabutan.jp/

(HOGE "出来高の上昇と株価の上昇は比例の関係にある場合が多い" :check)
(HOGE "逆ウォッチ曲線")
(HOGE "出来高の多いことは、投資家に人気")
(HOGE "出来高の多いときに買うと、購買意欲のある投資家がいなくなる可能性が高い。買いは控えた方がよい")
(HOGE "株価が急騰した後に、利益確定で急落することがある。下値は出来高の低いときが多い." :check)

(HOGE "上場廃止となる条件" "
- 上場基準となる時価総額・株主数・流通株式数が基準を下回ること
- 完全子会社化
- 債務超過・破産・再生手続きなどの経営破綻
- 有価証券報告所の提出の遅れや虚偽記載
- 反社会勢力との関与
")

(p "スカイマークの例
今が割安などの煽りが記載され、短期的に上昇する可能性あり.
スカイマークが民事再生法の申請を決めたというニュースが流れてきたのは、1/28の夕方
2015年2月27日（金）に 東証一部での取引を終了

- 1/28　終値：317円
- 1/29　終値：237円（ストップ安）
- 1/30　終値：157円（ストップ安）
- 2/2 　始値：32円、終値：19円
- 2/27　終値：14円
")

(HOGE "200日移動平均線の特徴" "1年の休日を除いた営業日になる。中長期のトレンドとしては有効(騙しが少ない)")

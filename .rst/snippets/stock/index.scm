cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

=======
 Stock
=======

$(goshe '(sphinx-create-index-in-directory (glob "*")) ""')
$(goshe '(print (sphinx-toctree-directory. (glob "*")))')

EOS

LINKS (株の入門)
- http://www.miller.co.jp/index.html#levelupArea

(HOGE "出来高の上昇と株価の上昇は比例の関係にある場合が多い" :check)
(HOGE "逆ウォッチ曲線")
(HOGE "出来高の多いことは、投資家に人気")
(HOGE "出来高の多いときに買うと、購買意欲のある投資家がいなくなる可能性が高い。買いは控えた方がよい")
(HOGE "株価が急騰した後に、利益確定で急落することがある。下値は出来高の低いときが多い." :check)


# 木構造の移動方法

- PRE:  parent -> left   -> right  (幅優先 上から下へ)
- POST: left   -> right  -> parent (深優先 下から上へ)
- IN:   left   -> parent -> right  (左優先 左から右へ)

逆順の時は、矢印の向きが逆になるだけ

## rule

- prevに移動しないようガードする
- rootのnilが最終的な終了状態
- 7 patterns
- 始めの状態？親から？左？右？

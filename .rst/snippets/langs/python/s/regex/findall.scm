import re

# マッチした文字列のリストを返す。
# 文字列は左から右へ捜査されるので、マッチしない文字は結果に含まれない

assert re.findall(r'(\w+)', u'word word, word') == [u'word', u'word', u'word']

# グループがあると、タプルで返す
assert re.findall(r'(\w+) (\w+)', u'wo wo, wo wo') == [(u'wo', u'wo'), (u'wo', u'wo')]

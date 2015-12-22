import re

def test_1():
    # WARN: \sは、全角スペースにマッチしない
    assert not re.match(r'\s', u"　")
    assert not re.match(ur'\s', u"　")
    
    # WARN: 全角同士をマッチするにはuをつけること
    assert not re.match(r'　', u"　")
    assert re.match(ur'　', u"　")
    
    # UNICODEフラグをつけると、\sが全角にマッチ 
    assert re.match(r'\s', u"　", re.UNICODE)
    assert re.match(ur'\s', u"　", re.UNICODE)


(node "Math.floor(-5.5)")
(node "Math.floor(5.5)")

(ps "is int")
(py "is_int = lambda x: math.ceil(x) == math.floor(x)"
    :msg "小数において切り上げと切り下げが等しい場合は整数と判定できる")

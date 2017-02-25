
(p "メンバ変数にアクセスはできない")

(py "
class Math(object):
 pi = 3.14
 @classmethod
 def get_circle_area(cls, r):
  return r * r * cls.pi
print(Math.get_circle_area(10))
" :str #t)

(ruby "
# Mathはバッティングするのでエラー
class MyMath
 @@pi = 3.14
 def MyMath.get_circle_area(r)
  r * r * @@pi
 end
end
puts MyMath.get_circle_area 10
" :str #t)

(php "1" :str #t)

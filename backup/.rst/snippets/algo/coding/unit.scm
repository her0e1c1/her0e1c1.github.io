

(py "
def show(n):
 sign = ''
 if n < 0:
  n *= -1
  sign = '-'
 def to_s(x, unit, label=''):
  return '%s%.1f%sB' % (sign, x / float(unit), label)
 for index, label in enumerate(['', 'K', 'M', 'G']):
  start = 10 ** (3 * index)
  end = start * (10 ** 3)
  if start <= n < end:
   return to_s(n, start, label)
 else:
  return to_s(n, 1)
print(show(0))
print(show(1))
print(show(1440))
print(show(-1440))
print(show(1444))
print(show(1444000))
print(show(1444000 * 10 ** 3))
print(show(1444000 * 10 ** 6))
")

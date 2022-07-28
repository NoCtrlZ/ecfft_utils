# pasta curve p
p = 0x40000000000000000000000000000000224698fc094cf91b992d30ed00000001
F = GF(p)

def get_curve(n):
  while True:
      b = F.random_element()
      E = EllipticCurve(F, [1, b])
      if E.order() % n == 0:
        print(E)

n = 2^12
get_curve(n)

# Result
# Elliptic Curve defined by y^2 = x^3 + x + 23665697887148517506426806798051226694671519983424102823343279587811911881026 over Finite Field of size 28948022309329048855892746252171976963363056481941560715954676764349967630337

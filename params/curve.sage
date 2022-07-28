p = 0x40000000000000000000000000000000224698fc094cf91b992d30ed00000001
F = GF(p)

def find_curve(n):
  while True:
      b = F.random_element()
      E = EllipticCurve(F, [1, b])
      if E.order() % n == 0:
        print(E)

n = 2^12
find_curve(n)

# pasta curve p
p = 0x40000000000000000000000000000000224698fc094cf91b992d30ed00000001
f = GF(p)
# order n curve
b = 0x34524F71A21A7096C6AD51A6A7FE7A43D76D8E4277CB9048EDC87AB655E55142
e = EllipticCurve(f, [1, b])
# order n subgroup generator
g = e([13291508082879694854521082086792197848350555733901620272991399076728860730024, 2771972034012816234278958541077708750421584610675159152316836625989042411228, 1])
# coset generator
r = e([12104365721214676982589157293811342696374079725317925507576658390741145576647, 1485115919656286686020752692305320611224771971582286074732326174318375410873, 1])

def get_isogeny(g, r, n, e):
  log_n = n.log(2)
  # h coset of p
  h = [r + i*g for i in range(n)]
  # projective of h coset
  l = [elm.xy()[0] for elm in h]
  # s
  s = [l[i] for i in range(0, n, 2)]
  # s'
  s_prime = [l[i] for i in range(1, n, 2)]

  # get isogenies
  isos = []
  for i in range(log_n-1, 0, -1):
    n = 1 << i
    nn = n // 2
    for iso in e.isogenies_prime_degree(2):
        psi = iso.x_rational_map()
        if len(set([psi(x) for x in s])) == nn:
            break
        isos.append(psi)
        s = [psi(x) for x in s[:nn]]
        s_prime = [psi(x) for x in s_prime[:nn]]
        e = iso.codomain()
  print(isos)

n = 2^12
get_isogeny(g, r, n, e)

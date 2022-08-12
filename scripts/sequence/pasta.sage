import sys

p = 0x40000000000000000000000000000000224698fc094cf91b992d30ed00000001
a = 1
b = 23665697887148517506426806798051226694671519983424102823343279587811911881026

F = GF(p)
E = EllipticCurve(F, [a, b])
O = E.order()
n = O.p_primary_part(2)
log_n = n.log(2)
k = 1

while True:
    k += 1
    g = E.random_point()
    G = (O // n) * g
    for i in range(log_n):
        if ((2 ^ i) * G).is_zero():
            break
    else:
        break
    print(k)

assert (n * G).is_zero()
R = E.random_element()
H = [R + i * G for i in range(2 ^ log_n)]
L = [h.xy()[0] for h in H]
S = [L[i] for i in range(0, n, 2)]
S_prime = [L[i] for i in range(1, n, 2)]

for i in range(log_n, 0, -1):
    n = 1 << i
    nn = n // 2

    for iso in E.isogenies_prime_degree(2):
        psi = iso.x_rational_map()
        print("k =", n, i)
        if len(set([psi(x) for x in S])) == nn:
            print("k =", n, psi)
            break
    S = [psi(x) for x in S[:nn]]
    S_prime = [psi(x) for x in S_prime[:nn]]
    E = iso.codomain()

print(G, R)

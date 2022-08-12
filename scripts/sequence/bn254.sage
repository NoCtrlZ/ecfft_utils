import sys

p = 0x30644E72E131A029B85045B68181585D97816A916871CA8D3C208C16D87CFD47
a = 1
b = 5612291247948481584627780310922020304781354847659642188369727566000581075360

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

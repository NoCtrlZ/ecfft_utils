# pasta curve p
p = 0x40000000000000000000000000000000224698fc094cf91b992d30ed00000001
f = GF(p)
# order n curve
b = 0x34524F71A21A7096C6AD51A6A7FE7A43D76D8E4277CB9048EDC87AB655E55142
e = EllipticCurve(f, [1, b])

def get_subgroup_generator(e,n):
    log_n = n.log(2)
    g = e.random_point()
    G = (e.order()//n) * g
    assert (n * G).is_zero()
    print(g)
    return G

n = 2^12
g = get_subgroup_generator(e, n)
assert (n * g).is_zero()
print(n * g)

# Result
# g = (13935305717534473436709899852561150416557919363223384543328468990689001463145 : 5190577772990356597531111309115758159783051218157620859971611368506648019322 : 1)

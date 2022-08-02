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

n = 2^12
get_subgroup_generator(e, n)

# Result
# g = (13291508082879694854521082086792197848350555733901620272991399076728860730024 : 2771972034012816234278958541077708750421584610675159152316836625989042411228 : 1)

use pasta_curves::arithmetic::*;

pub(crate) fn swap_bit_reverse<G: Group>(a: &mut [G], n: usize, k: u32) {
    assert!(k <= 64);
    let diff = 64 - k;
    for i in 0..n as u64 {
        let ri = i.reverse_bits() >> diff;
        if i < ri {
            a.swap(ri as usize, i as usize);
        }
    }
}

pub(crate) fn butterfly_arithmetic<G: Group>(
    left: &mut [G],
    right: &mut [G],
    twiddle_chunk: usize,
    twiddles: &[G::Scalar],
) {
    // case when twiddle factor is one
    let t = right[0];
    right[0] = left[0];
    left[0].group_add(&t);
    right[0].group_sub(&t);

    left.iter_mut()
        .zip(right.iter_mut())
        .enumerate()
        .skip(1)
        .for_each(|(i, (a, b))| {
            let mut t = *b;
            t.group_scale(&twiddles[i * twiddle_chunk]);
            *b = *a;
            a.group_add(&t);
            b.group_sub(&t);
        });
}

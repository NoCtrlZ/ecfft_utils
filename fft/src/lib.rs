mod fft;

pub use fft::Fft;

#[cfg(test)]
mod tests {
    use super::Fft;
    use ff::Field;
    use pasta_curves::Fp;
    use rand_core::OsRng;

    #[test]
    fn fft_test() {
        let k = 12;
        let rng = OsRng;
        let fft = Fft::new(k);
        let mut poly = (0..1 << k).map(|_| Fp::random(rng)).collect::<Vec<_>>();
        fft.fft(&mut poly)
    }
}

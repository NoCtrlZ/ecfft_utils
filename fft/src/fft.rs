pub use ff::Field;
use group::{
    ff::{BatchInvert, PrimeField},
    Group as _,
};
pub use pasta_curves::arithmetic::*;

#[derive(Clone, Debug)]
pub struct Fft<G: Group> {
    k: u32,
    multiplicative_generator: G::Scalar,
}

impl<G: Group> Fft<G> {
    fn new(k: u32) -> Self {
        let unity_of_root = G::Scalar::root_of_unity();
        let k_diff = G::Scalar::S - k;
        let multiplicative_generator = unity_of_root.pow_vartime(&[k_diff as u64, 0, 0, 0]);

        Fft {
            k,
            multiplicative_generator,
        }
    }
}

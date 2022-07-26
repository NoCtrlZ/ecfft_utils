# ECFFT Utils
The libraries related to [`ECFFT`](https://arxiv.org/pdf/2107.08473.pdf).

## Abstract
When performing the multiplication for P(X) and Q(X) over `Fp` where `P(X), Q(X) ∈ Fp[X]` by using Cooley Tukey algorithm, it's necessary to find the multiplicative group `G` whose order is `n = 2^k`. The ECFFT can remove the limitation of `n | p - 1` that traditional FFT needs.

# ECFFT Utils
The libraries related to [`ECFFT`](https://arxiv.org/pdf/2107.08473.pdf).

## Abstract
When performing the polynomials multiplication by traditional FFT, it's necessary to find the multiplicative group $G: |G| = n = 2^k$ satisfying $n\ |\ p - 1$.

$$
P(X)\ *\ Q(X)\ where\ P(X),\ Q(X)\ ∈ F_p[X]
$$

The ECFFT can remove the limitation of $n\ |\ p - 1$ that traditional FFT needs.

## Arithmetic
When using Cooley Tukey algorithm, the FFT structure is following.

$$
P(X) = P_0(ψ(X)) + XP_1(ψ(X))
$$

$P_0$ and $P_1$ are respectively even and odd degree half size polynomials of $P(X)$. Evaluate half size polynomials at $ψ(X)$ recursively and get $P(X)$ with $\mathcal{O}(n\log{}n)$.

## Precompute
- Common  
Firstly, finding the $ψ$ and precomputing the domain of $P_0$ and $P_1$.
Classic FFT uses $ψ: X \rightarrow X^2$ so it's not necessary to find $ψ$.

- Classic FFT
1. Finding unity of root.
2. Calculating multiplicative group for each recursion whose group order is $2^k$ staring with power unity of root.

- ECFFT
1. Finding curve whose group order is $2^k$.
2. Finding isogeny which halves group size.
3. Calculating multiplicative group for each recursion halved by isogeny.

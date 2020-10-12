"""
    PoissonExpert(λ)

Expert function: `PoissonExpert(λ)`.

"""
struct PoissonExpert{T<:Real} <: NonZIDiscreteExpert
    λ::T
    PoissonExpert{T}(λ::T) where {T<:Real} = new{T}(λ)
end

function PoissonExpert(λ::T; check_args=true) where {T <: Real}
    check_args && @check_args(PoissonExpert, λ >= zero(λ))
    return PoissonExpert{T}(λ)
end

## Outer constructors
# PoissonExpert(λ::Real) = PoissonExpert(promote(λ)...)
PoissonExpert(λ::Integer) = PoissonExpert(float(λ))

## Loglikelihood of Expoert
logpdf(d::PoissonExpert, x...) = isinf(x...) ? 0.0 : Distributions.logpdf.(Distributions.Poisson(d.λ), x...)
pdf(d::PoissonExpert, x...) = isinf(x...) ? -Inf : Distributions.pdf.(Distributions.Poisson(d.λ), x...)
logcdf(d::PoissonExpert, x...) = isinf(x...) ? 0.0 : Distributions.logcdf.(Distributions.Poisson(d.λ), x...)
cdf(d::PoissonExpert, x...) = isinf(x...) ? 1.0 : Distributions.cdf.(Distributions.Poisson(d.λ), x...)
# using Distributions
# using PDMats # test dependencies
using Test
# using Distributed
using Random
# using StatsBase
# using LinearAlgebra
# using HypothesisTests

# import JSON
# import ForwardDiff

const tests = [
    "dummytest",
]

printstyled("Running tests:\n", color=:blue)

Random.seed!(345679)

# to reduce redundancy, we might break this file down into seperate `$t * "_utils.jl"` files
# include("testutils.jl")

for t in tests
    @testset "Test $t" begin
        Random.seed!(345679)
        include("$t.jl")
    end
end

# print method ambiguities
println("Potentially stale exports: ")
display(Test.detect_ambiguities(JLRMoE))
println()
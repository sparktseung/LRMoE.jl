using Test
using Distributions
using StatsFuns

using LRMoE


@testset "Poisson, exact" begin

    # # Fit 20,000 observations as an example

    # param0 = rand(Distributions.Uniform(0, 1), 1)[1]
    # param1 = rand(Distributions.Uniform(0.5, 8), 1)[1]

    # X = rand(Distributions.Uniform(-5, 5), 20000, 7)
    # α = rand(Distributions.Uniform(-1, 1), 2, 7)
    # α[2,:] .= 0

    # model = [PoissonExpert(param1) PoissonExpert(2*param1);
    #         PoissonExpert(3*param1) PoissonExpert(0.5*param1)]

    # expos = rand(Distributions.Uniform(0.1, 5), 20000)
    # Y_sim = LRMoE.sim_dataset(α, X, model, exposure = expos)

    # α_guess = fill(0.0, 2, 7)
    # model_guess = [PoissonExpert(0.5*param1) PoissonExpert(3*param1);
    #                 PoissonExpert(2*param1) PoissonExpert(param1)]

    # pen_α = 5
    # pen_params = [[[1.0 Inf], [1.0 Inf]],
    #               [[1.0 Inf], [1.0 Inf]]]

    # result = LRMoE.fit_exact(Y_sim, X, α_guess, model_guess,
    #                     exposure = expos,
    #                     penalty = true, 
    #                     pen_α = pen_α, pen_params = pen_params,
    #                     # ϵ = 1e-03, α_iter_max = 5.0, ecm_iter_max = 200,
    #                     # grad_jump = true, grad_seq = nothing,
    #                     print_steps = true)
    
    # α
    # result.α_fit 
   
    # model
    # result.model_fit



end


@testset "ZIPoisson, exact" begin

    # # Fit 20,000 observations as an example

    # param0 = rand(Distributions.Uniform(0, 1), 4)
    # param1 = rand(Distributions.Uniform(0.5, 8), 1)[1]

    # X = rand(Distributions.Uniform(-5, 5), 20000, 7)
    # α = rand(Distributions.Uniform(-1, 1), 2, 7)
    # α[2,:] .= 0

    # model = [ZIPoissonExpert(param0[1], param1) ZIPoissonExpert(param0[2], 2*param1);
    #          ZIPoissonExpert(param0[3], 3*param1) ZIPoissonExpert(param0[4], 0.5*param1)]

    # expos = rand(Distributions.Uniform(0.1, 5), 20000)
    # Y_sim = LRMoE.sim_dataset(α, X, model, exposure = expos)

    # α_guess = fill(0.0, 2, 7)
    # model_guess = [ZIPoissonExpert(0.50, 0.5*param1) ZIPoissonExpert(0.50, 3*param1);
    #                ZIPoissonExpert(0.50, 2*param1) ZIPoissonExpert(0.50, param1)]

    # pen_α = 5
    # pen_params = [[[1.0 Inf], [1.0 Inf]],
    #               [[1.0 Inf], [1.0 Inf]]]

    # result = LRMoE.fit_exact(Y_sim, X, α_guess, model_guess,
    #                     exposure = expos,
    #                     penalty = true, 
    #                     pen_α = pen_α, pen_params = pen_params,
    #                     # ϵ = 1e-03, α_iter_max = 5.0, ecm_iter_max = 200,
    #                     # grad_jump = true, grad_seq = nothing,
    #                     print_steps = true)
    
    # α
    # result.α_fit 
   
    # model
    # result.model_fit
    
end


@testset "NegativeBinomial, exact" begin

    # Fit 20,000 observations as an example

    param0 = rand(Distributions.Uniform(0, 1), 1)[1]
    param1 = rand(Distributions.Uniform(0.5, 8), 4)
    param2 = rand(Distributions.Uniform(0, 1), 4)

    X = rand(Distributions.Uniform(-5, 5), 50000, 7)
    α = rand(Distributions.Uniform(-1, 1), 2, 7)
    α[2,:] .= 0

    model = [NegativeBinomialExpert(param1[1], param2[1]) NegativeBinomialExpert(param1[2], param2[2]);
             NegativeBinomialExpert(param1[3], param2[3]) NegativeBinomialExpert(param1[4], param2[4])]

    expos = rand(Distributions.Uniform(0.1, 5), 50000)
    Y_sim = LRMoE.sim_dataset(α, X, model, exposure = expos)

    α_guess = fill(0.0, 2, 7)
    model_guess = [NegativeBinomialExpert(0.5*param1[1], 0.5) NegativeBinomialExpert(3*param1[2], 0.5);
                   NegativeBinomialExpert(2*param1[3], 0.5) NegativeBinomialExpert(0.2*param1[4], 0.5)]

    pen_α = 5
    pen_params = [[[1.0 Inf], [1.0 Inf]],
                  [[1.0 Inf], [1.0 Inf]]]

    result = LRMoE.fit_exact(Y_sim, X, α_guess, model_guess,
                        exposure = expos,
                        penalty = true, 
                        pen_α = pen_α, pen_params = pen_params,
                        # ϵ = 1e-03, α_iter_max = 5.0, ecm_iter_max = 200,
                        # grad_jump = true, grad_seq = nothing,
                        print_steps = true)
    
    α
    result.α_fit 
   
    model
    result.model_fit



end

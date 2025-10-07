using GraphProperties
using Test
using Aqua

@testset "GraphProperties.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(GraphProperties)
    end
    # Write your tests here.
end

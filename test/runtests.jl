using GraphProperties
using Test

@testset "GraphProperties.jl" begin
    # Write your tests here.
end

using Aqua: Aqua

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(GraphProperties)
end

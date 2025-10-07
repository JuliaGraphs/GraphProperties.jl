using GraphProperties
using Test

@testset "GraphProperties.jl" begin
    @testset "construction, subtyping" begin
        @test PropertyComparison(==, Arboricity(), 2) isa GraphProperty{Bool}
        @test PropertyComparison(<=, Boxicity(), 2) isa GraphProperty{Bool}
        @test GraphIsChordal() isa GraphProperty{Bool}
        @test Arboricity() isa GraphProperty{Integer}
        @test FractionalChromaticNumber() isa GraphProperty{Real}
        @test DegreeSequence() isa GraphProperty{AbstractVector{<:Integer}}
    end
end

using Aqua: Aqua

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(GraphProperties)
end

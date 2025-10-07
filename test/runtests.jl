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
    @testset "`graph_property_type`" begin
        @test Bool === @inferred graph_property_type(GraphIsCograph())
        @test Integer === @inferred graph_property_type(Degeneracy())
        @test Real === @inferred graph_property_type(Strength())
        @test AbstractVector{<:Integer} == @inferred graph_property_type(DegreeSequence())
    end
end

using Aqua: Aqua

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(GraphProperties)
end

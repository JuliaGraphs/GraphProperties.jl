module GraphProperties

export
    GraphProperty,
    PropertyComparison

abstract type GraphProperty{T} end

struct PropertyComparison{
    Comparison <: Union{typeof(==), typeof(≤), typeof(≥)},
    Property <: GraphProperty{<:Real},
    Value,
} <: GraphProperty{Bool}
    comparison::Comparison
    property::Property
    value::Value
end

let
    properties_abstractvector = Symbol[
        :DegreeSequence,
    ]
    properties_real = Symbol[
        :FractionalChromaticNumber,
        :FractionalMatchingNumber,
    ]
    properties_integer = Symbol[
        :NumberOfVertices,
        :NumberOfEdges,
        :NumberOfArcs,
        :NumberOfConnectedComponents,
        :MinimumDegree,
        :MaximumDegree,
        :Girth,
        :VertexConnectivity,
        :EdgeConnectivity,
        :CliqueNumber,
        :ChromaticNumber,
        :ChromaticIndex,
        :MatchingNumber,
        :DominationNumber,
        :IndependenceNumber,
        :Choosability,
        :FeedbackVertexSetNumber,
        :VertexCoverNumber,
        :EdgeCoverNumber,
        :IntersectionNumber,
        :BipartiteDimension,
        :HadwigerNumber,
        :TwinWidth,
        :CliqueWidth,
        :Treewidth,
        :Pathwidth,
        :Boxicity,
        :Degeneracy,
        :Arboricity,
        :Splittance,
    ]
    properties_bool = Symbol[
        :IsUndirectedGraph,
        :IsDirectedGraph,
        :DigraphIsDAG,
        :DigraphIsOrientation,
        :GraphIsConnected,
        :DigraphIsWeaklyConnected,
        :DigraphIsStronglyConnected,
        :GraphIsBipartite,
        :GraphIsPath,
        :GraphIsCycle,
        :GraphIsPlanar,
        :DigraphIsPlanar,
        :GraphIsTriangleFree,
        :GraphIsComplete,
        :GraphIsRegular,
        :GraphIsPerfect,
        :GraphIsTriviallyPerfect,
        :GraphIsForest,
        :GraphIsTree,
        :GraphIsIndifferenceGraph,
        :GraphIsIntervalGraph,
        :GraphIsPtolemaic,
        :GraphIsChordal,
        :GraphIsMeynielGraph,
        :GraphIsCircleGraph,
        :GraphIsPermutationGraph,
        :GraphIsCograph,
        :GraphIsComparabilityGraph,
        :GraphIsDistanceHereditary,
        :GraphIsSplitGraph,
    ]
    for (typ, properties) ∈ (
        (AbstractVector, properties_abstractvector),
        (Real, properties_real),
        (Integer, properties_integer),
        (Bool, properties_bool),
    )
        for p ∈ properties
            @eval export $p
            @eval struct $p <: GraphProperty{$typ} end
        end
    end
end

# TODO: doc strings

end

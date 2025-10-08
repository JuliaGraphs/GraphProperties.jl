module GraphProperties

export
    GraphProperty,
    graph_property_type,
    PropertyComparison

"""
    GraphProperty::Type

Abstract supertype for graph properties.

The only type parameter is the type of each value of the property.
"""
abstract type GraphProperty{T} end

"""
    graph_property_type(::GraphProperty{T}) -> T

Get the type of each value of the property.

It is not allowed to add methods to this function.
"""
function graph_property_type(::GraphProperty{T}) where {T}
    T
end

"""
    PropertyComparison(comparison, property, value)

Turn a `GraphProperty{<:Real}` into a `GraphProperty{Bool}` by attaching a comparison against a value.
"""
struct PropertyComparison{
    Comparison <: Union{typeof(==), typeof(≤)},
    Property <: GraphProperty{<:Real},
    Value,
} <: GraphProperty{Bool}
    comparison::Comparison
    property::Property
    value::Value
end

let
    properties_abstractvector_integer = Tuple{Symbol, String}[
        (:DegreeSequence, "The *degree sequence* of an undirected graph."),
    ]
    properties_real = Tuple{Symbol, String}[
        (:FractionalChromaticNumber, "The *fractional chromatic number* of an undirected graph."),
        (:FractionalMatchingNumber, "The *fractional matching number* of an undirected graph."),
        (:Strength, "The *strength* of an undirected graph."),
        (:AssortativityCoefficient, "The *assortativity coefficient* of an undirected graph."),
        (:GlobalClusteringCoefficient, "The *global clustering coefficient* of an undirected graph."),
    ]
    properties_integer = Tuple{Symbol, String}[
        (:NumberOfVertices, "The *number of vertices* of a graph."),
        (:NumberOfEdges, "The *number of edges* of an undirected graph."),
        (:NumberOfArcs, "The *number of arcs* of a directed graph."),
        (:NumberOfConnectedComponents, "The *number of connected components* of an undirected graph."),
        (:MinimumDegree, "The *minimum degree* among the degrees of the vertices of an undirected graph."),
        (:MaximumDegree, "The *maximum degree* among the degrees of the vertices of an undirected graph."),
        (:MinimumIndegree, "The *minimum indegree* among the indegrees of the vertices of a directed graph."),
        (:MaximumIndegree, "The *maximum indegree* among the indegrees of the vertices of a directed graph."),
        (:MinimumOutdegree, "The *minimum outdegree* among the outdegrees of the vertices of a directed graph."),
        (:MaximumOutdegree, "The *maximum outdegree* among the outdegrees of the vertices of a directed graph."),
        (:Radius, "The *radius* of a connected undirected graph."),
        (:Diameter, "The *diameter* of a connected undirected graph."),
        (:Triameter, "The *triameter* of a connected undirected graph."),
        (:Girth, "The *girth* of a undirected graph: the length of its shortest cycle."),
        (:VertexConnectivity, "The *vertex-connectivity* of an undirected graph. Also known as the *connectivity*."),
        (:EdgeConnectivity, "The *edge-connectivity* of an undirected graph."),
        (:CliqueNumber, "The *clique number* of an undirected graph."),
        (:ChromaticNumber, "The *chromatic number* of an undirected graph."),
        (:ChromaticIndex, "The *chromatic index* of an undirected graph. Also known as the *edge chromatic number*."),
        (:MatchingNumber, "The *matching number* of an undirected graph."),
        (:DominationNumber, "The *domination number* of an undirected graph."),
        (:StrongDominationNumber, "The *strong domination number* of an undirected graph."),
        (:IndependenceNumber, "The *independence number* of an undirected graph."),
        (:Choosability, "The *choosability* of an undirected graph. Also known as the *list colorability* or as the *list chromatic number*."),
        (:FeedbackVertexSetNumber, "The *feedback vertex set number* of a graph."),
        (:VertexCoverNumber, "The *vertex cover number* of an undirected graph."),
        (:EdgeCoverNumber, "The *edge cover number* of an undirected graph."),
        (:IntersectionNumber, "The *intersection number* of an undirected graph. Also known as the *R-content* or as the *edge clique cover number* or as the *clique cover number*."),
        (:BipartiteDimension, "The *bipartite dimension* of an undirected graph. Also known as the *biclique cover number*."),
        (:HadwigerNumber, "The *Hadwiger number* of an undirected graph. Also known as the *contraction clique number* or as the *homomorphism degree*."),
        (:TwinWidth, "The *twin-width* of an undirected graph."),
        (:CliqueWidth, "The *clique-width* of an undirected graph."),
        (:Treewidth, "The *treewidth* of an undirected graph."),
        (:Pathwidth, "The *pathwidth* of an undirected graph. Also known as the *interval thickness* or as the *vertex separation number* or as the *node searching number*."),
        (:Boxicity, "The *boxicity* of an undirected graph."),
        (:Sphericity, "The *sphericity* of an undirected graph."),
        (:Degeneracy, "The *degeneracy* of an undirected graph. Also known as the *width* or as the *linkage*."),
        (:Arboricity, "The *arboricity* of an undirected graph."),
        (:Splittance, "The *splittance* of an undirected graph."),
    ]
    properties_bool = Tuple{Symbol, String}[
        (:IsUndirectedGraph, "Is something an undirected graph?"),
        (:IsDirectedGraph, "Is something a directed graph?"),
        (:DigraphIsDAG, "Is a directed graph acyclic (a DAG)?"),
        (:DigraphIsOrientation, "Is a directed graph an orientation?"),
        (:GraphIsConnected, "Is an undirected graph connected?"),
        (:DigraphIsWeaklyConnected, "Is a directed graph weakly connected?"),
        (:DigraphIsStronglyConnected, "Is a directed graph strongly connected?"),
        (:GraphIsBipartite, "Is an undirected graph bipartite?"),
        (:GraphIsPath, "Is an undirected graph a path?"),
        (:GraphIsCycle, "Is an undirected graph a cycle?"),
        (:GraphIsPlanar, "Is an undirected graph planar?"),
        (:DigraphIsPlanar, "Is a directed graph planar?"),
        (:GraphIsTriangleFree, "Is an undirected graph triangle-free?"),
        (:GraphIsComplete, "Is an undirected graph complete?"),
        (:GraphIsRegular, "Is an undirected graph regular?"),
        (:GraphIsPerfect, "Is an undirected graph perfect?"),
        (:GraphIsTriviallyPerfect, "Is an undirected graph trivially perfect?"),
        (:GraphIsForest, "Is an undirected graph a forest?"),
        (:GraphIsTree, "Is an undirected graph a tree?"),
        (:GraphIsIndifferenceGraph, "Is an undirected graph an indifference graph?"),
        (:GraphIsIntervalGraph, "Is an undirected graph an interval graph?"),
        (:GraphIsPtolemaic, "Is an undirected graph Ptolemaic?"),
        (:GraphIsChordal, "Is an undirected graph chordal?"),
        (:GraphIsMeynielGraph, "Is an undirected graph a Meyniel graph?"),
        (:GraphIsCircleGraph, "Is an undirected graph a circle graph?"),
        (:GraphIsPermutationGraph, "Is an undirected graph a permutation graph?"),
        (:GraphIsCograph, "Is an undirected graph a cograph?"),
        (:GraphIsComparabilityGraph, "Is an undirected graph a comparability graph?"),
        (:GraphIsDistanceHereditary, "Is an undirected graph distance-hereditary?"),
        (:GraphIsSplitGraph, "Is an undirected graph a split graph?"),
    ]
    for (typ, properties) ∈ (
        (AbstractVector{<:Integer}, properties_abstractvector_integer),
        (Real, properties_real),
        (Integer, properties_integer),
        (Bool, properties_bool),
    )
        for (name, desc) ∈ properties
            @eval export $name
            @eval begin
                """
                    $($name)()

                $($desc)

                ```jldoctest
                julia> using GraphProperties

                julia> $($name)() isa GraphProperty{$($typ)}
                true
                ```
                """
                struct $name <: GraphProperty{$typ} end
            end
        end
    end
end

end

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
    ag = "a graph"
    ug = "an undirected graph"
    dg = "a directed graph"
    cg = "a connected undirected graph"
    properties_abstractvector_integer = Tuple{Symbol, String, Vector{String}, String}[
        (:DegreeSequence, "*degree sequence*", [], ug),
    ]
    properties_real = Tuple{Symbol, String, Vector{String}, String}[
        (:FractionalChromaticNumber, "*fractional chromatic number*", [], ug),
        (:FractionalMatchingNumber, "*fractional matching number*", [], ug),
        (:Strength, "*strength*", [], ug),
        (:AssortativityCoefficient, "*assortativity coefficient*", [], ug),
        (:GlobalClusteringCoefficient, "*global clustering coefficient*", [], ug),
        (:CheegerConstant, "*Cheeger constant*", ["*Cheeger number*", "*isoperimetric number*"], ug),
        (:Circumference, "*circumference*", [], ug),
        (:Girth, "*girth*", [], ug),
    ]
    properties_integer = Tuple{Symbol, String, Vector{String}, String}[
        (:NumberOfVertices, "*number of vertices*", ["*order*"], ag),
        (:NumberOfEdges, "*number of edges*", ["*size*"], ug),
        (:NumberOfArcs, "*number of arcs*", [], dg),
        (:NumberOfConnectedComponents, "*number of connected components*", [], ug),
        (:NumberOfWeaklyConnectedComponents, "*number of weakly connected components*", [], dg),
        (:NumberOfStronglyConnectedComponents, "*number of strongly connected components*", [], dg),
        (:MinimumDegree, "*minimum degree*", [], ug),
        (:MaximumDegree, "*maximum degree*", [], ug),
        (:MinimumIndegree, "*minimum indegree*", [], dg),
        (:MaximumIndegree, "*maximum indegree*", [], dg),
        (:MinimumOutdegree, "*minimum outdegree*", [], dg),
        (:MaximumOutdegree, "*maximum outdegree*", [], dg),
        (:Radius, "*radius*", [], cg),
        (:Diameter, "*diameter*", [], cg),
        (:Triameter, "*triameter*", [], cg),
        (:VertexConnectivity, "*vertex-connectivity*", ["*connectivity*"], ug),
        (:EdgeConnectivity, "*edge-connectivity*", [], ug),
        (:CliqueNumber, "*clique number*", [], ug),
        (:ChromaticNumber, "*chromatic number*", [], ug),
        (:ChromaticIndex, "*chromatic index*", ["*edge chromatic number*"], ug),
        (:MatchingNumber, "*matching number*", [], ug),
        (:DominationNumber, "*domination number*", [], ug),
        (:StrongDominationNumber, "*strong domination number*", [], ug),
        (:IndependenceNumber, "*independence number*", [], ug),
        (:Choosability, "*choosability*", ["*list colorability*", "*list chromatic number*"], ug),
        (:FeedbackVertexSetNumber, "*feedback vertex set number*", [], ag),
        (:VertexCoverNumber, "*vertex cover number*", [], ug),
        (:EdgeCoverNumber, "*edge cover number*", [], ug),
        (:IntersectionNumber, "*intersection number*", ["*R-content*", "*edge clique cover number*", "*clique cover number*"], ug),
        (:BipartiteDimension, "*bipartite dimension*", ["*biclique cover number*"], ug),
        (:HadwigerNumber, "*Hadwiger number*", ["*contraction clique number*", "*homomorphism degree*"], ug),
        (:TwinWidth, "*twin-width*", [], ug),
        (:CliqueWidth, "*clique-width*", [], ug),
        (:TreeDepth, "*tree-depth*", [], ug),
        (:CycleRank, "*cycle rank*", [], dg),
        (:Treewidth, "*treewidth*", [], ug),
        (:Pathwidth, "*pathwidth*", ["*interval thickness*", "*vertex separation number*", "*node searching number*"], ug),
        (:Boxicity, "*boxicity*", [], ug),
        (:Sphericity, "*sphericity*", [], ug),
        (:Degeneracy, "*degeneracy*", ["*width*", "*linkage*"], ug),
        (:Arboricity, "*arboricity*", [], ug),
        (:Splittance, "*splittance*", [], ug),
    ]
    properties_bool = Tuple{Symbol, String, Vector{String}, String}[
        (:IsUndirectedGraph, "an *undirected graph*", [], ag),
        (:IsDirectedGraph, "a *directed graph*", ["a *digraph*"], ag),
        (:DigraphIsDAG, "a *directed acyclic graph*", ["a *DAG*"], dg),
        (:DigraphIsOrientation, "an *orientation*", [], dg),
        (:GraphIsConnected, "*connected*", [], ug),
        (:DigraphIsWeaklyConnected, "*weakly connected*", [], dg),
        (:DigraphIsStronglyConnected, "*strongly connected*", [], dg),
        (:GraphIsBipartite, "*bipartite*", [], ug),
        (:GraphIsCompleteBipartite, "*complete bipartite*", ["a *biclique*"], ug),
        (:GraphIsPath, "a *path*", [], ug),
        (:GraphIsCycle, "a *cycle*", [], ug),
        (:GraphIsPlanar, "*planar*", [], ug),
        (:DigraphIsPlanar, "*planar*", [], dg),
        (:GraphIsOuterplanar, "*outerplanar*", [], ug),
        (:GraphIsMaximalOuterplanar, "*maximal outerplanar*", [], ug),
        (:GraphIsTriangleFree, "*triangle-free*", [], ug),
        (:GraphIsComplete, "*complete*", [], ug),
        (:GraphIsRegular, "*regular*", [], ug),
        (:GraphIsDistanceRegular, "*distance-regular*", [], ug),
        (:GraphIsDistanceTransitive, "*distance-transitive*", [], ug),
        (:GraphIsStronglyRegular, "*strongly regular*", [], ug),
        (:GraphIsPerfect, "*perfect*", [], ug),
        (:GraphIsTriviallyPerfect, "*trivially perfect*", [], ug),
        (:GraphIsModular, "*modular*", [], ug),
        (:GraphIsMedianGraph, "a *median graph*", [], ug),
        (:GraphIsSquaregraph, "a *squaregraph*", [], ug),
        (:GraphIsForest, "a *forest*", [], ug),
        (:GraphIsTree, "a *tree*", [], ug),
        (:GraphIsStar, "a *star*", [], ug),
        (:GraphIsIndifferenceGraph, "an *indifference graph*", [], ug),
        (:GraphIsIntervalGraph, "an *interval graph*", [], ug),
        (:GraphIsPtolemaic, "*Ptolemaic*", [], ug),
        (:GraphIsChordal, "*chordal*", [], ug),
        (:GraphIsStronglyChordal, "*strongly chordal*", [], ug),
        (:GraphIsDuallyChordal, "*dually chordal*", [], ug),
        (:GraphIsChordalBipartite, "*chordal bipartite*", [], ug),
        (:GraphIsMeynielGraph, "a *Meyniel graph*", [], ug),
        (:GraphIsCircleGraph, "a *circle graph*", [], ug),
        (:GraphIsPermutationGraph, "a *permutation graph*", [], ug),
        (:GraphIsCograph, "a *cograph*", [], ug),
        (:GraphIsComparabilityGraph, "a *comparability graph*", [], ug),
        (:GraphIsDistanceHereditary, "*distance-hereditary*", [], ug),
        (:GraphIsSplitGraph, "a *split graph*", [], ug),
        (:GraphIsCartesianProduct, "a *Cartesian product* of two graphs", ["a box product"], ug),
    ]
    for (typ, properties) ∈ (
        (AbstractVector{<:Integer}, properties_abstractvector_integer),
        (Real, properties_real),
        (Integer, properties_integer),
        (Bool, properties_bool),
    )
        for (name, natural_name, aliases, assumed) ∈ properties
            lead = if typ == Bool
                "Is $assumed $natural_name?"
            else
                "The $natural_name of $assumed."
            end
            desc = if isempty(aliases)
                lead
            else
                string(lead, " Also known as:\n\n", mapreduce((a -> string("* ", a)), ((l, r) -> string(l, "\n\n", r)), aliases))
            end
            @eval export $name
            @eval begin
                """
                    $($name)()

                $($desc)

                Example:

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

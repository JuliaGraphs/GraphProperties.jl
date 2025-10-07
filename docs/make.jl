using GraphProperties
using Documenter

DocMeta.setdocmeta!(GraphProperties, :DocTestSetup, :(using GraphProperties); recursive=true)

makedocs(;
    modules=[GraphProperties],
    authors="Neven Sajko <s@purelymail.com> and contributors",
    sitename="GraphProperties.jl",
    format=Documenter.HTML(;
        canonical="https://JuliaGraphs.github.io/GraphProperties.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaGraphs/GraphProperties.jl",
    devbranch="main",
)

using Documenter
using TinyAD
using DocThemeIndigo

indigo = DocThemeIndigo.install(Configurations)

makedocs(;
    modules = [TinyAD],
    format = Documenter.HTML(
        prettyurls = !("local" in ARGS),
        canonical="https://Yusheng Zhao.github.io/TinyAD.jl",
        assets=String[indigo],
    ),
    pages = [
        "Home" => "index.md",
    ],
    repo = "https://github.com/Yusheng Zhao/TinyAD.jl",
    sitename = "TinyAD.jl",
)

deploydocs(; repo = "https://github.com/Yusheng Zhao/TinyAD.jl")

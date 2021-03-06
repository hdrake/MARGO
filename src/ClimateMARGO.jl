module ClimateMARGO

if VERSION < v"1.5"
    @error "ClimateMARGO requires Julia v1.5 or newer."
end

include("Models/Models.jl")
include("Utils/Utils.jl")
include("Diagnostics/Diagnostics.jl")
include("Optimization/Optimization.jl")
include("IO/IO.jl")
include("PolicyResponse/PolicyResponse.jl")
if get(ENV, "JULIA_MARGO_LOAD_PYPLOT", "1") == "1"
    # default
    include("Plotting/Plotting.jl")
else
    # (in our API, we don't load the plotting functions.)
    @info "Not loading plotting functions"
end
end
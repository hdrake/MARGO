"Export a [`ClimateModel`](@ref) instance to a `.json` file.

This `.json` file can be shared with others, you can import it using "
function export_state(m::ClimateModel, path::AbstractString)
    open(path, "w") do io
        JSON2.write(io, m)
    end
end

function import_state(name::String)::ClimateModel
    open(path, "r") do io
        return JSON2.read(io, ClimateModel)
    end
end

function export_parameters(params::ClimateModelParameters, path::AbstractString)
    open(path, "w") do io
        JSON2.write(io, params)
    end
end

function import_parameters(path::AbstractString)::ClimateModelParameters
    open(path, "r") do io
        return JSON2.read(io, ClimateModelParameters)
    end
end

"""The [`ClimateModelParameters`](@ref) included with this package.

Currently `included_configurations["default"]` is the only included set."""
const included_configurations = let
    # find the config dir relative to this .jl file
    config_dir = joinpath(@__DIR__, "..", "..", "configurations")
    loaded = import_parameters.(readdir(config_dir, join=true))
    Dict(p.name => p for p in loaded)
end
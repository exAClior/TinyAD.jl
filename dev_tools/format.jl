using JuliaFormatter

# get directory of current project
project_dir = splitdir(dirname(@__FILE__))[1]

format(project_dir)


# we provide motivation of why ditching Zygote for Enzyme
# by comparing and contrasting following the example of
# EnzymeCon tutorial
using Enzyme, Zygote, Test, BenchmarkTools

function square(x::Real)
    return x * x
end

# let's see how both are supposed to work
@btime Zygote.gradient(square, rand(Float64))

@btime Enzyme.gradient(Reverse, square, rand(Float64))
@btime Enzyme.autodiff(Forward, square, Duplicated, Duplicated(rand(Float64), 1.0))


function mag(x::AbstractVector)
    return sqrt(sum(x.^2))
end

function normalize!(in::AbstractVector,out::AbstractVector)
    for i in 1:length(in)
        # this is extremely in efficient
        out[i] = in[i] / mag(in)
    end
    return 0
end

# Zygote can't handle modification of input
@btime Enzyme.gradient(Forward, normalize!, rand(100))

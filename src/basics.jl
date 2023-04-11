export Dual


struct Dual{T<:Number}
    x::T
    dx::T
end

Base.+(a::Dual, b::Dual) = Dual(a.x + b.x, a.dx + b.dx)
Base.-(a::Dual, b::Dual) = Dual(a.x - b.x, a.dx - b.dx)
Base.*(a::Dual, b::Dual) = Dual(a.x * b.x, a.x * b.dx + a.dx * b.x)
Base./(a::Dual, b::Dual) = Dual(a.x / b.x, (a.dx * b.x - a.x * b.dx) / b.x^2)

Base.getindex(a::Dual, i::Int) = i == 1 ? a.x : a.dx

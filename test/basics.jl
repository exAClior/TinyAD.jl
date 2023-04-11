
@testset "basics" begin
    f(x) = x^2

    @test Enzyme.gradient(f, 3.14) ≈ f(Dual(3.14,1.0))[2]
end

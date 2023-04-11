@testset "basics" begin
    randx, randdx = rand(Float64, 2)
    randy, randdy = rand(Float64, 2)
    add(x, y) = x + y
    @test add(Dual(randx, randdx), Dual(randy, randdy))[2] ≈ Enzyme.autodiff(
        Forward,
        add,
        DuplicatedNoNeed,
        Duplicated(randx, randdx),
        Duplicated(randy, randdy),
    )[1]

    subt(x, y) = x - y
    @test subt(Dual(randx, randdx), Dual(randy, randdy))[2] ≈ Enzyme.autodiff(
        Forward,
        subt,
        DuplicatedNoNeed,
        Duplicated(randx, randdx),
        Duplicated(randy, randdy),
    )[1]

    mult(x, y) = x * y
    @test mult(Dual(randx, randdx), Dual(randy, randdy))[2] ≈ Enzyme.autodiff(
        Forward,
        mult,
        DuplicatedNoNeed,
        Duplicated(randx, randdx),
        Duplicated(randy, randdy),
    )[1]

    divd(x, y) = x / y
    @test divd(Dual(randx, randdx), Dual(randy, randdy))[2] ≈ Enzyme.autodiff(
        Forward,
        divd,
        DuplicatedNoNeed,
        Duplicated(randx, randdx),
        Duplicated(randy, randdy),
    )[1]

    f(x) = x^2
    @test f(Dual(randx, randdx))[2] ≈
          Enzyme.autodiff(Forward, f, DuplicatedNoNeed, Duplicated(randx, randdx))[1]
end

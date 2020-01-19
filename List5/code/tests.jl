# Eryk Krupa
# 244993

push!(LOAD_PATH, "/mnt/d/Projekty/Julia/scientific-computing/List5/code")
using blocksys
using Test

@testset "gauss_without_pivots" begin
(A,n,l) = load_matrix("Dane50000_1_1/A.txt")
b = right_side_vector(A, n, l)
@time begin
    x_vector = gauss_without_pivots(A, n, l, b)
end
write_to_file("result1.txt", x_vector, n, true)
@testset for x in @view x_vector[:,:]
    @test x ≈ 1.0
end
end


@testset "gauss_with_pivots" begin
(A,n,l) = load_matrix("Dane50000_1_1/A.txt")
b = right_side_vector(A, n, l)
@time begin
    x_vector = gauss_with_pivots(A, n, l, b)
end
write_to_file("result2.txt", x_vector, n, true)
@testset for x in @view x_vector[:,:]
    @test x ≈ 1.0
end
end


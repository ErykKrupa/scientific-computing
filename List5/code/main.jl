# Eryk Krupa
# 244993

push!(LOAD_PATH, "/mnt/d/Projekty/Julia/scientific-computing/List5/code")
using blocksys

function main()
(A,n,l) = load_matrix("generated.txt")
b = right_side_vector(A, n, l)
write_to_file("b.txt", b, n, false)
x = gauss_without_pivots(A, n, l, b)
write_to_file("result1.txt", x, n, false)
x = gauss_with_pivots(A, n, l, b)
write_to_file("result2.txt", x, n, false)
end
main()
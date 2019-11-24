# Eryk Krupa
# 244993

push!(LOAD_PATH, "/mnt/d/Projekty/Julia/scientific-computing/List3/code")
using Methods

function main()
    result = mbisekcji(x -> sin(x) - ((1 / 2) * x) ^ 2, 1.5, 2.0, (1 / 2) * 10 ^ -5, (1 / 2) * 10 ^ -5)
    println("Bisection: \tresult = $(result.r), \tvalue = $(result.v), \titerations = $(result.it)")

    result = mstycznych(x -> sin(x) - ((1 / 2) * x) ^ 2, x -> cos(x) - x, 1.5, (1 / 2) * 10 ^ -5, (1 / 2) * 10 ^ (-5), 20)
    println("Newton: \tresult = $(result.r), \tvalue = $(result.v), \titerations = $(result.it)")

    result = msiecznych(x -> sin(x) - ((1 / 2) * x) ^ 2, 1.0, 2.0, (1 / 2) * 10 ^ -5, (1 / 2) * 10 ^ -5, 20)
    println("Secant: \tresult = $(result.r), \tvalue = $(result.v), \titerations = $(result.it)")
end
main()

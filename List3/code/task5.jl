# Eryk Krupa
# 244993

push!(LOAD_PATH, "/mnt/d/Projekty/Julia/scientific-computing/List3/code")
using Methods

function main()
    println("Results:")
    result = mbisekcji(x -> 3x - (MathConstants.e) ^ x, 0.0, 1.0, 10 ^ -4, 10 ^ -4)
    println("result = $(result.r), \tvalue = $(result.v), \titerations = $(result.it)")
    result = mbisekcji(x -> 3x - (MathConstants.e) ^ x, 1.0, 2.0, 10 ^ -4, 10 ^ -4)
    println("result = $(result.r), \tvalue = $(result.v), \titerations = $(result.it)")
end
main()
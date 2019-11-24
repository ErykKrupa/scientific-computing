# Eryk Krupa
# 244993

push!(LOAD_PATH, "/mnt/d/Projekty/Julia/scientific-computing/List3/code")
using Methods

function bisectionTest(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    result = Methods.mbisekcji(f, a, b, delta, epsilon);
    println("result = $(result.r), \tvalue = $(result.v), \titerations = $(result.it), \terror = $(result.err)");
end

function tangentTest(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    result = mstycznych(f, pf, x0, delta, epsilon, maxit)
    println("result = $(result.r), \tvalue = $(result.v), \titerations = $(result.it), \terror = $(result.err)");
end

function secantTest(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    result = msiecznych(f, x0, x1, delta, epsilon, maxit)
    println("result = $(result.r), \tvalue = $(result.v), \titerations = $(result.it), \terror = $(result.err)");
end
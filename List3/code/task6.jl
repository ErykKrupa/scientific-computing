# Eryk Krupa
# 244993

include("test.jl")

function main()
    e = MathConstants.e
    println("f1(x)")
    println("Bisection: ")
    bisectionTest(x -> (e ^ (1 - x)) - 1, 0.0, 2.0, 10 ^ -5, 10 ^ -5)

    println("Newton: ")
    tangentTest(x -> (e ^ (1 - x)) - 1.0, x -> -(e ^ (1 - x)), 1.0, 10 ^ -5, 10 ^ -5, 20)
    
    println("Secant: ")
    secantTest(x -> (e ^ (1 - x)) -1.0, 0.0, 2.0, 10 ^ -5, 10 ^ -5, 20)
    

    println("\nf2(x)")
    println("Bisection: ")
    bisectionTest(x -> x * (e ^ -x), -1.0, 1.0, 10 ^ -5, 10 ^ -5)
    
    println("Newton: ")
    tangentTest(x -> x * (e ^ -x), x -> -(e ^ -x) * (x - 1), 0.0, 10 ^ -5, 10 ^ -5, 20)
    
    println("Secant: ")
    secantTest(x -> x * (e ^ -x), -0.1, 0.1, 10 ^ -5, 10 ^ -5, 20)

    println("\nf1(x) in Newton methon with x0 in (1, inf]:")
    tangentTest(x -> (e ^ (1 - x)) - 1.0, x -> -(e ^ (1 - x)), 1.00001, 10 ^ -5, 10 ^ -5, 20)
    tangentTest(x -> (e ^ (1 - x)) - 1.0, x -> -(e ^ (1 - x)), 2.0, 10 ^ -5, 10 ^ -5, 20)
    tangentTest(x -> (e ^ (1 - x)) - 1.0, x -> -(e ^ (1 - x)), 5.0, 10 ^ -5, 10 ^ -5, 200)
    tangentTest(x -> (e ^ (1 - x)) - 1.0, x -> -(e ^ (1 - x)), 8.0, 10 ^ -5, 10 ^ -5, 20000)

    println("\nf2(x) in Newton methon with x0 > 1:")
    tangentTest(x -> x * (e ^ -x), x -> -(e ^ -x) * (x - 1), 2.0, 10 ^ -5, 10 ^ -5, 20)
    tangentTest(x -> x * (e ^ -x), x -> -(e ^ -x) * (x - 1), 50.0, 10 ^ -5, 10 ^ -5, 20)
    tangentTest(x -> x * (e ^ -x), x -> -(e ^ -x) * (x - 1), 200.0, 10 ^ -5, 10 ^ -5, 20)
    tangentTest(x -> x * (e ^ -x), x -> -(e ^ -x) * (x - 1), 5000.0, 10 ^ -5, 10 ^ -5, 20)

    println("\nf2(x) in Newton methon with x0 == 1:")
    tangentTest(x -> x * (e ^ -x), x -> -(e ^ -x) * (x - 1), 1.0, 10 ^ -5, 10 ^ -5, 20)
end

main()
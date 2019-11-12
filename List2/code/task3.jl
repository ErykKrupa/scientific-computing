# Eryk Krupa
# 244993

include("hilb.jl")
include("matcond.jl")

function hilbert()
    for i in 2:15
        x = [1.0 for j in 1:i] 
        hilbertMatrix = hilb(i)
        b = hilbertMatrix * x
        gauss = hilbertMatrix \ b
        reverse = inv(hilbertMatrix) * b

        print("$i;")
        print("$(rank(hilbertMatrix));")
        print("$(cond(hilbertMatrix));")
        print("$(abs((norm(gauss - x)) / norm(x)));")
        println("$(abs((norm(reverse - x)) / norm(x)))")
    end
end

function matcond()
    n = [5, 10, 20]
    c = [1.0, 10.0, 10.0^3, 10.0^7, 10.0^12, 10.0^16]

    for i in n
        x = [1.0 for j in 1:i] 
        for j in c 
            matrix = matcond(i, j)
            b = matrix * x
            gauss = matrix \ b
            reverse = inv(matrix) * b

            print("$i;")
            print("$j;")
            print("$(rank(matrix));")
            print("$(cond(matrix));")
            print("$(abs((norm(gauss - x)) / norm(x)));")
            println("$(abs((norm(reverse - x)) / norm(x)))")

        end
    end
end

function main()
    hilbert();
    println();
    matcond();
end
main()

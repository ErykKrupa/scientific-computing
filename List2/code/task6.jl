# Eryk Krupa
# 244993

f(x, c) = x ^ 2 + c

function main()
    arr = [Pair(-2, 1),
    Pair(-2, 2),
    Pair(-2, 1.99999999999999),
    Pair(-1, 1),
    Pair(-1, -1),
    Pair(-1, 0.75),
    Pair(-1, 0.25)]
    
    print("c;x0")
    for i in 1:40
        print(";$i")
    end
    println()
    
    for pair in arr
        print("$(pair.first);$(pair.second)")
        out = pair.second
        for i in 1:40
            out = f(out, pair.first)
            print(";$out")
        end
        println()
    end
end
main()
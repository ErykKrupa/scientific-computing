# Eryk Krupa
# 244993

populate(p, r) = p + r * p * (1 - p)

function print(i, result1, result2)
    println("$i.;$result1;$result2;$(abs(result1-result2))")
end

function main()
    p0 = 0.01
    r = 3
    
    result1 = p0
    result2 = p0
    for i in 1:9
        result1 = Float32(populate(result1, r))
        result2 = Float32(populate(result2, r))
        print(i, result1, result2) 
    end
    result1 = Float32(populate(result1, r))
    result2 = Float32(populate(result2, r)) 
    result2 -= result2 % 0.001
    print(10, result1, result2)
    for i in 11:40
        result1 = Float32(populate(result1, r))
        result2 = Float32(populate(result2, r))
        print(i, result1, result2)
    end
    println()

    result1 = p0
    result2 = p0
    for i in 1:40
        result1 = Float32(populate(result1, r))
        result2 = Float64(populate(result2, r))
    print(i, result1, result2)
    end
end
main()
# Eryk Krupa
# 244993


function calculateEpsilon(type)
    epsilon = type(1.0)
    while type(1.0 + 0.5 * epsilon) != 1.0 
        epsilon = type(0.5 * epsilon)
    end
    return epsilon;
end

function calculateNext(type)
    next = type(1.0)
    while type(0.5 * next) != 0.0
        next = type(0.5 * next)
    end
    return next
end

function calculateMax(type)
    max = type(1.0)
    while !isinf(type(2 * max))
        max = type(2 * max)
    end
    for j in 2:-0.001:1
        if !isinf(type(j * max))
            max = type(j * max)
        end
    end
    return max
end

types = DataType[Float16, Float32, Float64]

function main()
    for type in types
        println(string(type) * ":")
        println("Epsilon:\t\t" * string(eps(type)))
        println("My epsilon:\t\t" * string(calculateEpsilon(type)))
        println("Next float:\t\t" * string(nextfloat(type(0.0))))
        println("My next float:\t\t" * string(calculateNext(type)))
        println("Maximum float:\t\t" * string(floatmax(type)))
        println("My maximum float:\t" * string(calculateMax(type)))
        println()
    end
    println("Minimum float:")
    println("Float32:\t\t" * string(floatmin(Float32)))
    println("Float64:\t\t" * string(floatmin(Float64)))
end
main()
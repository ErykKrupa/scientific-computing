# Eryk Krupa
# 244993

types = DataType[Float16, Float32, Float64]

function calculateKahan(type)
    return type(type(3 * type(type(4 / 3) - 1)) - 1) 
end

function main()
    for type in 1:3
        println(types[type])
        kahan = calculateKahan(types[type])
        println("Kahan:\t\t" * string(kahan))
        println("Kahan:\t\t" * string(abs(kahan)))
        println("Macheps:\t" * string(eps(types[type])) * "\n")
    end
end
main()
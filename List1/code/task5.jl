# Eryk Krupa
# 244993

function print(letter, sum, exact)
    println(string(letter) * ")")
    println("Sum = " * string(sum))
    println("Error = " * string(abs(sum - exact)))
end

function calculateElements(type, x, y)

end

function calculate(type)
    exact = type(-1.00657107000000 * 10^-11)
    x = type[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
    y = type[1486.2497,   878366.9879,  -22.37492,   4773714.647,  0.000185049 ]

    elements = [0.0, 0.0, 0.0, 0.0, 0.0]
    for i in 1:5
        elements[i] = x[i] * y[i]
    end
    
    positive = type[]
    negative = type[]
    for i in 1:5
        if elements[i] >= 0.0
            push!(positive, elements[i])
        else
            push!(negative, elements[i])
        end
    end
 
    println(string(type) * ":")
    
    sum = type(0.0)
    for i in 1:5
        sum += elements[i]
    end
    print("A", sum, exact)

    sum = type(0.0)
    for i in 5:-1:1
        sum += x[i] * y[i]
    end
    print("B", sum, exact)

    sum = type(0.0)
    sort(positive, rev = true)
    sort(negative, rev = false)
    for element in positive
        sum += element
    end
    for element in negative
        sum += element
    end
    print("C", sum, exact) 
                    
    sort(positive, rev = false)
    sort(negative, rev = true)
    sum = type(0.0)
    for element in positive
        sum +=element
    end
    for element in negative
        sum += element
    end
    print("D", sum, exact)
end

function main() 	
    calculate(Float32)
    println()
	calculate(Float64)
end
main()
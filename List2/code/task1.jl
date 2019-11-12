# Eryk Krupa
# 244993

x1 = [2.718281828,-3.141592654,1.414213562,0.5772156649,0.3010299957]
y1 = [1486.2497,878366.9879,-22.37492,4773714.647,0.000185049]
x2 = [2.718281828,-3.141592654,1.414213562,0.577215664,0.301029995]
y2 = [1486.2497,878366.9879,-22.37492,4773714.647,0.000185049]

function calculate(x, y, type)
    sum = type(0.0)
    for i in 1:5
        sum += type(x[i]) * type(y[i])
    end
    println("A) " * string(sum)) 

    sum = type(0.0)
    for i in 5:-1:1
        sum += type(x[i]) * type(y[i])
    end
    println("B) " * string(sum)) 

    positive = type[]
    negative = type[]
    for i in 1:5
        if x[i] * y[i] > 0.0
            push!(positive, x[i] * y[i])
        else
            push!(negative, x[i] * y[i])
        end
    end

    positiveSum = type(0.0)
    negativeSum = type(0.0)
    sort(positive, rev = true)
    sort(negative, rev = false)
    for element in positive
        positiveSum += element
    end
    for element in negative
        negativeSum += element
    end
    sum = type(positiveSum + negativeSum)
    println("C) " * string(sum))

    positiveSum = type(0.0)
    negativeSum = type(0.0)
    sort(positive, rev = false)
    sort(negative, rev = true)         
    for element in positive
        positiveSum += element
    end
    for element in negative
        negativeSum += element
    end
    sum = type(positiveSum + negativeSum)
    print("D) " * string(sum))
    println()
end

function main()
    println("1. Float32")
    calculate(x1, y1, Float32)
    println("1. Float64")
    calculate(x1, y1, Float64)
    println("2. Float32")
    calculate(x2, y2, Float32)
    println("2. Float64")
    calculate(x2, y2, Float64)
end
main()
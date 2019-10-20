# Eryk Krupa
# 244993

function main()
    x = Float64(1.0)
	counter = 0
    while Float64(x * Float64(1 / x)) == Float64(1.0)
        x = nextfloat(x)
		counter = counter + 1
    end
	one = Float64(x * Float64(1 / x))
	println("After " * string(counter) * " attempts:")
	println("x * (1 / x) = " * string(one))
    println("x = " * string(x))
end
main()
# Eryk Krupa
# 244993

function main()
    x0 = Float64(1.0)
    f(x) = Float64(sin(x) + cos(3x)) 
    derivative(h) = Float64((f(x0 + h) - f(x0)) / h)
	exactDerivative = Float64(cos(x0) - 3 * sin(3 * x0))
    
	println("n:\tDerivative: \t\t\tDifference:")
    println("Exact:\t" * string(exactDerivative) * "\t\t" *string(0.0))
    for n in 0:54
		print(string(n) * ":\t")
        print(string(derivative(2.0^-n)) * "   \t\t")
		println(string(abs(exactDerivative - derivative(2.0^-n))))
    end
end
main()
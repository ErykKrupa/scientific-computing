# Eryk Krupa
# 244993

function main()
    i = 0
    f = Float64(-1)
    g = Float64(-1)
    while !(f == 0 && g == 0)
        i -= 1
        x = Float64(8.0^i)
		squareRoot = sqrt(x^2 + 1)
        print("8^" * string(i) * ":\t")
		
        f = Float64(squareRoot - 1)
		print("f(x) = " * string(f) * "\t")
        
		g = Float64((x^2) / (squareRoot + 1))
		print("g(x) = " * string(g))
		println()
    end
end
main()
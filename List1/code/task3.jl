# Eryk Krupa
# 244993

minRanges = Float64[0.5, 1.0, 2.0]
maxRanges = Float64[1.0, 2.0, 4.0]

function main()
	println("Delta: \t\t\t" * string(Float64(2^-52)))
	println()
	for i in 1:3 
	    println("[" * string(minRanges[i]) * ":" * string(maxRanges[i]) * "]")
		a = minRanges[i]
		b = nextfloat(minRanges[i])
		c = prevfloat(maxRanges[i])
		d = maxRanges[i]
		println("Delta: \t\t\t$(nextfloat(a) - a)")
		println(string(a) * ":\t\t\t" * bitstring(a))
		println(string(b) * ":\t"     * bitstring(b))
		println(string(c) * ":\t"     * bitstring(c))
		println(string(d) * ":\t\t\t" * bitstring(d))
		println()
	end
end
main()
# Eryk Krupa
# 244993

include("Interpolation.jl")
using .Interpolation

data = [["a", x->abs(x), -1.0, 1.0],["b",x->(1/(1+x^2)), -5.0, 5.0]]

for d in data
    for n in [5, 10, 15]
        rysujNnfx(d[2], d[3], d[4], n)
    end
end

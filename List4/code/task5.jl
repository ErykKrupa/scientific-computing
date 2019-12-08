# Eryk Krupa
# 244993

include("Interpolation.jl")
using .Interpolation

data = [["a", x->MathConstants.e^x, 0.0, 1.0],["b",x->(sin(x)) * (x^2), -1.0, 1.0]]

for d in data
    for n in [5, 10, 15]
        rysujNnfx(d[2], d[3], d[4], n)
    end
end

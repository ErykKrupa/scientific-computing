include("Interpolation.jl")
using .Interpolation

x = [-1.0:2.0...]
y = [-1.0, 0.0, -1.0, 2.0]
print(naturalna(x, ilorazyRoznicowe(x, y)))
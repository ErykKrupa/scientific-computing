# Eryk Krupa
# 244993

include("Interpolation.jl")
using .Interpolation
using Test

# ilorazyRoznicowe
expected = [1.0,1.0,0.0]
@test ilorazyRoznicowe([1.0:3.0...], [1.0:3.0...]) == expected

expected = [1.0,2.0,-0.375,0.175]
e1 = expected .- 0.0001
e2 = expected .+ 0.0001;
@test ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]) > e1
@test ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]) < e2

# warNewton
x = [3.0, 1.0, 5.0, 6.0]
@test warNewton(x, ilorazyRoznicowe(x, [1.0, -3.0, 2.0, 4.0]), 3.0) == 1
x = [1.0:2.0:10.0...]
y = [7x^4+6x^3+5x^2+4x+3 for x in x]
@test warNewton(x, ilorazyRoznicowe(x, y), 2.0) == 191

# naturalna
x = [1.0:10.0...]
y = [2x^2 for x in 1.0:10.0]
@test naturalna(x, ilorazyRoznicowe(x, y)) == [0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

# rysujNnfx
    rysujNnfx(x->x^2,-5.0,5.0,5)

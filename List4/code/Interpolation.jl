# Eryk Krupa
# 244993

module Interpolation

using Plots
export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    if (length(x) != length(f))
        throw(ArgumentError("Vectors have different length"))
    end
    n = length(x)
    fx = deepcopy(f)
    for j in 1:n - 1
        for i in n:-1:j + 1
            fx[i] = (fx[i] - fx[i - 1]) / (x[i] - x[i - j])
        end
    end
    return fx
end

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    if (length(x) != length(fx))
        throw(ArgumentError("Vectors have different length"))
    end
    n = length(x)
    nt = fx[n]
    for i in n - 1:-1:1
        nt = nt * (t - x[i]) + fx[i]
    end
    return nt
end

function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    if(length(x) != length(fx))
        throw(ArgumentError("Given vectors must be of equal lenght"))
    end

    n = length(x)
    a = zeros(n)
    a[n] = fx[n]

    for i in n - 1:-1:1
        a[i] = fx[i] - a[i + 1] * x[i]
        for j in i + 1:n - 1
            a[j] = a[j] - a[j + 1] * x[i]
        end
    end
    return a
end

function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    resolution = 200
    h1 = (b - a) / n
    x = [a:h1:b...]
    y = [f(x[i]) for i in 1:n + 1]
    fx = ilorazyRoznicowe(x, y)
    exact = Array{Float64}(undef, resolution + 1)
    interpolated = Array{Float64}(undef, resolution + 1)
    h2 = (b - a) / resolution
    for i in 1:resolution + 1
        x1 = a + (i - 1) * h2
        exact[i] = f(x1)
        interpolated[i] = warNewton(x, fx, x1)
    end
    gr()
    xaxis = [a:h2:b...]
    plot(xaxis, exact, label = "Function")
    plot!(xaxis, interpolated, label = "Polynomial")
    png("result.png")
end
end

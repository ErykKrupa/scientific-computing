# Eryk Krupa
# 244993

module Methods
export mbisekcji
export mstycznych
export msiecznych

function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    valueLeft = f(a)
    valueRight = f(b)
    lenght = b - a
    if sign(valueLeft) == sign(valueRight)
        return (r = 0, v = 0, it = 0, err = 1)
    end
    i = 0
    while true
        i += 1
        lenght = lenght / 2
        middle = a + lenght
        value = f(middle)
        if lenght < delta || abs(value) < epsilon
            return (r = middle, v = value, it = i, err = 0)
        end
        if sign(valueLeft) == sign(value)
            a = middle
            valueLeft = value
        else
            b = middle
            valueRight = value
        end
    end
end

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    value =  f(x0)
    if abs(value) < epsilon
        return (r = x0, v = value, it = 0, err = 0)
    end
    if pf(x0) == 0.0
        return (r = x0, v = value, it = 0, err = 2)
    end
    for k in 1:maxit
        root = x0 - value / pf(x0)
        value = f(root)
        if abs(root - x0) < delta || abs(value) < epsilon
            return (r = root, v = value, it = k, err = 0)
        end
        x0 = root
    end
    return (r = x0, v = value, it = maxit, err = 1)
end

function swap(a, b)
    tmp = a
    a = b
    b = tmp
end

function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    value1 = f(x0)
    value2 = f(x1)
    for i in 1 : maxit
        if abs(value1) > abs(value2)
            swap(x0, x1)
            swap(value1, value2)
        end
        s = (x1 - x0) / (value2 - value1)
        x1 = x0
        value2 = value1
        x0 = x0 - value1 * s
        value1 = f(x0)
        if abs(x1 - x0) < delta || abs(value1) < epsilon
            return (r = x0, v = value1 , it = i , err = 0)
        end
    end
    return (r = x0, v = value1, it = maxit, err = 1)
end

end
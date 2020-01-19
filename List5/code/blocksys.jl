# Eryk Krupa
# 244993

module blocksys
using SparseArrays
using LinearAlgebra

export load_matrix, load_vector,
gauss_without_pivots, gauss_with_pivots,
right_side_vector, write_to_file

function load_matrix(file_path::String)
	open(file_path) do file
		ln = split(readline(file))
		n = parse(Int64, ln[1])
		l = parse(Int64, ln[2])
		el_num = n*l + 3*(n-l)
		J = Array{Int64}(undef, el_num)
		I = Array{Int64}(undef, el_num)
		V = Array{Float64}(undef, el_num)
		it = 1
		while !eof(file)
			ln = split(readline(file))
			J[it] = parse(Int64, ln[1])
			I[it] = parse(Int64, ln[2])
			V[it] = parse(Float64, ln[3])
			it += 1
		end
		A = sparse(I, J, V)
		return (A, n, l)
	end
end

function load_vector(file_path::String)
	open(file_path) do file
		n = parse(Int64, readline(file))
		b = Array{Float64}(undef, n)
		it = 0
		while !eof(file)
			it += 1
			b[it] = parse(Float64, readline(file))
		end
		return b
	end
end

function gauss_without_pivots(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64})
	for k in 1 : n-1
		last_row = convert(Int64, min(l + l * floor((k+1) / l), n))
		last_col = convert(Int64, min(k + l, n))
		for i in k + 1 : last_row
			if abs(A[k,k]) < eps(Float64)
				error("Współczynnik na przekątnej równy 0. Nie można zastosować metody.")
			end
			z = A[k, i] / A[k, k]
			A[k, i] = 0
			for j in k + 1 : last_col
				A[j, i] = A[j, i] - z * A[j, k]
			end
			b[i] = b[i] - z * b[k]
		end
	end

	x = Array{Float64}(undef, n)
	for i in n : -1 : 1
		prev_total = 0.0
		last_col = min(n, i + l)
		for j in i + 1 : last_col
			prev_total += A[j, i] * x[j]
		end
		x[i] = (b[i] - prev_total) / A[i, i]
	end
	return x
end

function gauss_with_pivots(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64})
	p = collect(1:n)

	for k in 1:n - 1
		last_row = convert(Int64, min(l + l * floor((k+1) / l), n))
		last_col = convert(Int64, min(2*l + l * floor((k+1) / l), n))
		for i in k + 1 : last_row
			max_row = k
			max = abs(A[k,p[k]])
			for x in i : last_row
				if (abs(A[k,p[x]]) > max)
					max_row = x;
					max = abs(A[k,p[x]])
				end
			end
			if (abs(max) < eps(Float64))
				error("Macierz osobliwa.")
			end
			p[k], p[max_row] = p[max_row], p[k]
			z = A[k,p[i]] / A[k,p[k]]
			A[k,p[i]] = 0
			for j in k + 1 : last_col
				A[j,p[i]] = A[j,p[i]] - z * A[j,p[k]]
			end
			b[p[i]] = b[p[i]] - z * b[p[k]]
		end
	end

	x = Array{Float64}(undef, n)
	for i in n : -1 : 1
		prev_total = 0.0
		last_col = convert(Int64, min(2*l + l*floor((p[i]+1)/l), n))
		for j in i + 1 : last_col
			prev_total += A[j,p[i]] * x[j]
		end
		x[i] = (b[p[i]] - prev_total) / A[i, p[i]]
	end
	return x
end

function right_side_vector(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
	b = zeros(Float64, n)
	for i in 1 : n
		from_col = convert(Int64, max(l * floor((i-1) / l) - 1, 1))
		last_col = convert(Int64, min(l + l * floor((i-1) / l), n))
		for j in from_col : last_col
			b[i] += A[j, i]
		end

		if (i + l <= n)
			b[i] += A[i + l, i]
		end
	end
	return b
end

function write_to_file(file_path::String, x::Array{Float64}, n::Int64, err::Bool)
	open(file_path, "w") do file
		if (err)
			relative_error = norm(ones(n) - x) / norm(x)
			println(file, relative_error)
		end
		for i in 1 : n
			println(file, x[i])
		end
	end
end

function main()
end
end
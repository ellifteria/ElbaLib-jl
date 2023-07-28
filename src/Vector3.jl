module Vector3

include("Optionals.jl")
using .Optionals

export Vec3, vec3_length_squared, vec3_length, add,
  scalar_add, hadamard, scalar_prod, subtract,
  scalar_subtract, to_string, to_vector, unit_vector

struct Vec3{T}
  e1::T
  e2::T
  e3::T
end

function vec3_length_squared(vector::Vec3)
  return vector.e1^2 + vector.e2^2 + vector.e3^2
end

function vec3_length(vector::Vec3)
  return sqrt(vec3_length_squared(vector))
end

function add(lhs::Vec3, rhs::Vec3)::Vec3
  return Vec3(lhs.e1 + rhs.e1, lhs.e2 + rhs.e2, lhs.e3 + rhs.e3)
end

function scalar_add(lhs::Vec3, rhs::Real)::Vec3
  return Vec3(
    lhs.e1 + rhs,
    lhs.e2 + rhs,
    lhs.e3 + rhs
  )
end

function hadamard(lhs::Vec3, rhs::Vec3)::Vec3
  return Vec3(
    lhs.e1 * rhs.e1,
    lhs.e2 * rhs.e2,
    lhs.e3 * rhs.e3
  )
end

function scalar_prod(lhs::Vec3, rhs::Real)::Vec3
  return Vec3(
    lhs.e1 * rhs,
    lhs.e2 * rhs,
    lhs.e3 * rhs
  )
end

function subtract(lhs::Vec3, rhs::Vec3)::Vec3
  return add(
    lhs,
    scalar_prod(rhs, -1)
  )
end

function scalar_subtract(lhs::Vec3, rhs::Real)::Vec3
  return scalar_add(
    lhs,
    -1 * rhs
  )
end

function unit_vector(vector::Vec3)
  return scalar_prod(
    vector,
    1/vec3_length(vector)
  )
end

function to_string(
  vector::Vec3,
  seperator::String=" "
)::String
  return string(vector.e1, seperator, vector.e2,
    seperator, vector.e3)
end

function to_vector(vector::Vec3)::Vector
  return [vector.e1, vector.e2, vector.e3]
end

end

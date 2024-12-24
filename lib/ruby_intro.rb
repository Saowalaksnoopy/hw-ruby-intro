# When done, submit this entire file to the autograder.

# Part 1

# Returns the sum of all elements in the array
def sum(arr)
  arr.sum
end

# Returns the sum of the two largest numbers in the array
def max_2_sum(arr)
  arr.max(2).sum
end

# Checks if any two numbers in the array sum to `n`
def sum_to_n?(arr, n)
  arr.combination(2).any? { |a, b| a + b == n }
end

# Part 2

# Returns a greeting message with the given name
def hello(name)
  "Hello, #{name}"
end

# Checks if a string starts with a consonant
def starts_with_consonant?(s)
  /^[bcdfghjklmnpqrstvwxyz]/i.match?(s)
end

# Checks if a string is a binary number and is a multiple of 4
def binary_multiple_of_4?(s)
  s.match?(/\A[01]+\z/) && s.to_i(2) % 4 == 0
end

# Part 3

# A class that represents a book with an ISBN and price
class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    raise ArgumentError, 'ISBN cannot be empty' if isbn.empty?
    raise ArgumentError, 'Price must be greater than 0' if price <= 0
    @isbn = isbn
    @price = price
  end

  # Returns the price formatted as a string with 2 decimal places
  def price_as_string
    format('$%.2f', @price)
  end
end


# frozen_string_literal: true

# Define the BookInStock class
class BookInStock
  attr_accessor :isbn, :price

  # Constructor for initializing a new book with ISBN and price
  # It raises an error if ISBN is empty or price is less than or equal to 0
  def initialize(isbn, price)
    raise ArgumentError, 'ISBN cannot be empty' if isbn.empty?  # Validate ISBN
    raise ArgumentError, 'Price must be greater than zero' if price <= 0  # Validate price

    @isbn = isbn  # Assign the ISBN value to the instance variable
    @price = price  # Assign the price value to the instance variable
  end

  # Method to format the price as a string with a dollar sign and two decimal places
  def price_as_string
    format('$%.2f', @price)  # Format price as currency (e.g. "$20.00")
  end
end

# frozen_string_literal: true  # This line is redundant, it should be removed

# Begin defining test cases using RSpec
describe 'BookInStock' do
  # Test if the BookInStock class is defined
  it 'is defined' do
    expect { BookInStock }.not_to raise_error  # Ensure the class is defined and no error is raised
  end

  describe 'getters and setters' do
    # Before each test, create a new BookInStock instance
    before { @book = BookInStock.new('isbn1', 33.8) }

    # Test getter for ISBN
    it 'sets ISBN [10 points]', points: 10 do
      expect(@book.isbn).to eq('isbn1')  # Expect ISBN to be 'isbn1'
    end

    # Test getter for price
    it 'sets price [10 points]', points: 10 do
      expect(@book.price).to eq(33.8)  # Expect price to be 33.8
    end

    # Test setter for ISBN (changing ISBN)
    it 'is able to change ISBN [10 points]', points: 10 do
      @book.isbn = 'isbn2'  # Change ISBN to 'isbn2'
      expect(@book.isbn).to eq('isbn2')  # Expect ISBN to be 'isbn2'
    end

    # Test setter for price (changing price)
    it 'is able to change price [10 points]', points: 10 do
      @book.price = 300.0  # Change price to 300.0
      expect(@book.price).to eq(300.0)  # Expect price to be 300.0
    end
  end

  describe 'constructor' do
    # Test if invalid ISBN is rejected (empty string)
    it 'rejects invalid ISBN number [10 points]', points: 10 do
      expect { BookInStock.new('', 25.00) }.to raise_error(ArgumentError)  # Expect error for empty ISBN
    end

    # Test if zero price is rejected
    it 'rejects zero price [10 points]', points: 10 do
      expect { BookInStock.new('isbn1', 0) }.to raise_error(ArgumentError)  # Expect error for zero price
    end

    # Test if negative price is rejected
    it 'rejects negative price [10 points]', points: 10 do
      expect { BookInStock.new('isbn1', -5.0) }.to raise_error(ArgumentError)  # Expect error for negative price
    end
  end

  describe '#price_as_string' do
    # Test if the method price_as_string is defined
    it 'is defined' do
      expect(BookInStock.new('isbn1', 10)).to respond_to(:price_as_string)  # Ensure the method exists
    end

    # Test if price is formatted correctly for 33.95
    it 'displays 33.95 as "$33.95" [10 points]', points: 10 do
      expect(BookInStock.new('isbn11', 33.95).price_as_string).to eq('$33.95')  # Expect formatted string "$33.95"
    end

    # Test if price is formatted correctly for 1.1
    it 'displays 1.1 as $1.10 [10 points]', points: 10 do
      expect(BookInStock.new('isbn11', 1.1).price_as_string).to eq('$1.10')  # Expect formatted string "$1.10"
    end

    # Test if price is formatted correctly for 20
    it 'displays 20 as $20.00 [10 points]', points: 10 do
      expect(BookInStock.new('isbn11', 20).price_as_string).to eq('$20.00')  # Expect formatted string "$20.00"
    end
  end
end

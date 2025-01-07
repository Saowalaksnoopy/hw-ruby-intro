# frozen_string_literal: true

require_relative '../lib/ruby_intro'

# Describe the tests for Ruby intro part 1
describe 'Ruby intro part 1' do
  # Test the sum function
  describe '#sum' do
    # Check if the sum method is defined and does not raise an error
    it 'is defined' do
      expect { sum([1, 3, 4]) }.not_to raise_error
    end

    # Test for correct sum calculation for various test cases
    it 'returns correct sum [20 points]', points: 20 do
      expect(sum([1, 2, 3, 4, 5])).to be_a Integer  # Expecting an Integer return type
      expect(sum([1, 2, 3, 4, 5])).to eq(15)       # Expect the sum to be 15
      expect(sum([1, 2, 3, 4, -5])).to eq(5)       # Test with negative numbers
      expect(sum([1, 2, 3, 4, -5, 5, -100])).to eq(-90)  # Test with more negative numbers
    end

    # Test if sum works for an empty array
    it 'works on the empty array [10 points]', points: 10 do
      expect { sum([]) }.not_to raise_error  # Expect no error when summing an empty array
      expect(sum([])).to be_zero            # The sum of an empty array should be 0
    end
  end

  # Test the max_2_sum function
  describe '#max_2_sum' do
    # Check if max_2_sum is defined and does not raise an error
    it 'is defined' do
      expect { max_2_sum([1, 2, 3]) }.not_to raise_error
    end

    # Test if max_2_sum returns the correct sum
    it 'returns the correct sum [7 points]', points: 7 do
      expect(max_2_sum([1, 2, 3, 4, 5])).to be_a Integer   # Expecting an Integer return type
      expect(max_2_sum([1, 2, 3, 4, 5])).to eq(9)           # Expect the sum of 4 and 5
      expect(max_2_sum([1, -2, -3, -4, -5])).to eq(-1)      # Test with negative numbers
    end

    # Test if the two largest values are the same
    it 'works even if 2 largest values are the same [3 points]', points: 3 do
      expect(max_2_sum([1, 2, 3, 3])).to eq(6)  # Sum of 3 + 3 = 6
    end

    # Test if max_2_sum returns zero for an empty array
    it 'returns zero if array is empty [10 points]', points: 10 do
      expect(max_2_sum([])).to be_zero  # The sum of an empty array should be 0
    end

    # Test if max_2_sum returns the value of the only element in a single-element array
    it 'returns value of the element if just one element [10 points]', points: 10 do
      expect(max_2_sum([3])).to eq(3)  # Only one element, so return it directly
    end
  end

  # Test the sum_to_n function
  describe '#sum_to_n' do
    # Check if sum_to_n? is defined and does not raise an error
    it 'is defined' do
      expect { sum_to_n?([1, 2, 3], 4) }.not_to raise_error
    end

    # Test if sum_to_n? returns true when any two elements sum to the second argument
    it 'returns true when any two elements sum to the second argument [30 points]', points: 30 do
      expect(sum_to_n?([1, 2, 3, 4, 5], 5)).to be true   # 2 + 3 = 5
      expect(sum_to_n?([3, 0, 5], 5)).to be true         # 0 + 5 = 5
      expect(sum_to_n?([-1, -2, 3, 4, 5, -8], -3)).to be true  # handles negative sums
      expect(sum_to_n?([-1, -2, 3, 4, 5, -8], 12)).to be false  # No two elements that sum to 12
      expect(sum_to_n?([-1, -2, 3, 4, 6, -8], 12)).to be false  # No two elements that sum to 12
    end

    # Test if sum_to_n? returns false for a single-element array
    it 'returns false for any single element array [5 points]', points: 5 do
      expect(sum_to_n?([0], 0)).to be false
      expect(sum_to_n?([1], 1)).to be false
      expect(sum_to_n?([-1], -1)).to be false
      expect(sum_to_n?([-3], 0)).to be false
    end

    # Test if sum_to_n? returns false for an empty array
    it 'returns false for an empty array [5 points]', points: 5 do
      expect(sum_to_n?([], 0)).to be false
      expect(sum_to_n?([], 7)).to be false
    end
  end
end





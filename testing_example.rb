#use this file as an example of how to write a test for an rb file
require "minitest/autorun"
require "minitest/pride"
require "./calc"

#first test. Tests that the test actually exists.
def CalculatorTest < Minitest::Test
def test_calculator_exists
calc = Calculator.new

assert_equal Calculator, calc.class

#this is the second test
def test_it_can_add_two_number
  calc = Calculator.new

  result = calc.add(2, 4)

  assert_equal 6, result
end

#third test
def test_it_can_add_other_numbers

  calc = Calculator.new

  result = calc.add(10, 3)

  assert_equal 13, result
end

#fourth test
def test_it_can_total
  calc = Calculator.new
  numbers1 = [1, 2, 3, 4, 5]
  numbers2 = [2, 3, 4]
  expected1 = 15
  expected2 = 9   #can use expected and actual instead of result to help with assertions at the bottom of the page

def test_it_can_average
  calc = Calculator.new
  numbers1 = [1, 2, 3, 4, 5]
  numbers2= [2, 3, 4]


  #can also call result actual
  result1 = calc.total (numbers)
  result2 = calc.total(numbers2)
  result3=  calc.average([0,10])

  assert_equal 15, expected1
  assert_equal 9, expected2
  assert_equal 7, expected1
  assert_equal 3, expected2

end
end
end

#an error is when there is something wrong with your code and code crashes
# a failure is when your code is correct, but you are not getting what you want.

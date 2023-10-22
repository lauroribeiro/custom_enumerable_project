# require 'bundler/inline'
# gemfile do
#   gem 'debug'
# end
# require 'debug'
module Enumerable
  def my_each_with_index
    for index in (0..self.length - 1)
      yield self[index], index
    end
    self
  end

  def my_all?
    self.my_each do |element|
      return false unless yield element
    end
    true
  end
  
  def my_any?
    self.my_each do |element|
      return true if yield element
    end
    false
  end

  def my_none?
    self.my_each do |element|
      return false if yield element
    end
    true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    self.my_each do |element|
      count += 1 if yield element
    end
    count
  end

  def my_map
    mapped_arr = []
    self.my_each do |element|
      mapped_arr << yield(element)
    end
    mapped_arr
  end

  def my_select
    selected_arr = []
    self.my_each do |element|
      selected_arr << element if yield(element)
    end
    selected_arr
  end

  def my_inject(initial_value = 0)
    sum = initial_value
    self.my_each do |element|
      sum = yield(sum, element)
    end
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self
      yield element
    end

    self
  end
end

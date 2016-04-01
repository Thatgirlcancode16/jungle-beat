gem 'pry'
require 'pry'
require "minitest/autorun"
require "minitest/pride"

class Node

  attr_accessor :data, :next_node

    def initialize(data)
      @data = data
      @next_node = next_node
    end
end

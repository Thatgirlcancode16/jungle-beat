gem 'minitest', '~> 5.2'
gem 'pry'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'node'
require_relative 'linked_list'
require_relative 'jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_it_has_a_node_with_data
    node = Node.new("plop")
    assert_equal "plop", node.data
    node.data = "bang"
    assert_equal "bang", node.data
  end

  def test_new_linked_list_head_nil
    list = LinkedList.new

    assert_equal nil, list.head
  end

  def test_append_first_node_counts_one
    list = LinkedList.new
    list.append("doop")

    assert_equal 1, list.count
  end

  def test_to_string_for_first_node
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.to_string
  end

  def test_prepend_next_node
    list = LinkedList.new
    list.prepend("plop")
    list.prepend("doop")
    nodes_array = list.get_nodes_array

    assert_equal "doop", nodes_array[0].data = "doop"
  end

  def test_insert_node
    list = LinkedList.new
    list.append("dop")
    list.append("plop")
    list.append("suu")
    list.insert(1, "woo")

    assert_equal "dop woo plop suu", list.to_string
  end

  def test_find_the_nodes
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "deep woo shi shu blop", list.to_string
    assert_equal "shi", list.find(2, 1)
    assert_equal "woo shi shu", list.find(1, 3)
  end

  def test_that_includes_node
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert list.includes?("deep")
    refute list.includes?("dep")
  end

  def test_that_pops_node
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "blop", list.pop
    assert_equal "shu", list.pop
    assert_equal "deep woo shi", list.to_string
  end

  def test_functionality_jungle_beat_wrapper
    jb = JungleBeat.new
    assert_equal nil, jb.list.head

    jb.append("deep doo ditt")
    assert_equal jb.list.head.data, "deep"
    assert_equal jb.list.head.next_node.data, "doo"

    jb.append("woo hoo shu")
    assert jb.count, 6
  end

  def play_our_beats
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    jb.play
  end

  def test_that_does_not_append_invalid_beat
    jb = JungleBeat.new
    jb.append("hey")
    assert_equal jb.count, 0
  end

  def test_play_our_beats_different_rates_and_voice
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    jb.rate = 100
    jb.voice = "Alice"
    jb.play
    jb.reset_rate
    jb.reset_voice
    assert_equal jb.voice, "Boing"
    assert_equal jb.rate, "500"
  end
end

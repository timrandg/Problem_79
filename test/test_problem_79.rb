$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

#requires all files in the lib folder
Dir.glob(File.dirname(__FILE__) + '/../lib/*'){|file| require file}
require "test/unit"

class TestParse < Test::Unit::TestCase
  def test_can_parse_num_file_into_rows
    data = Parse.new("../test_list.txt")
    assert_equal [[1,2,3], [1,3,4], [1,2,4], [2,3,4]], data.rows
  end
  def test_can_parse_num_file_into_columns
    data = Parse.new("../test_list.txt")
    assert_equal [[1,1,1,2], [2,3,2,3], [3,4,4,4]], data.columns
  end
  def test_gives_correct_answer_for_puzzles 
    assert_equal 73162890, Parse.new("../num_list.txt").give_answer
    assert_equal 1234, Parse.new("../test_list.txt").give_answer
  end
end

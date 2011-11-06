$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

#requires all files in the lib folder
Dir.glob(File.dirname(__FILE__) + '/../lib/*'){|file| require file}
require "test/unit"

class TestProblem_79 < Test::Unit::TestCase
  def test_can_parse_num_file_into_rows
    data = Parse.new("../num_list.txt")
    assert_equal [[1,2,3], [1,4,3], [1,2,4], [2,3,4]], data.rows
  end
  def test_can_parse_num_file_into_columns
    data = Parse.new("../num_list.txt")
    assert_equal [[1,1,1,2], [2,4,2,3], [3,3,4,4]], data.columns
  end
  def test_puts_histogram
    data = Parse.new("../num_list.txt")
    puts data.histogram_r
  end
end

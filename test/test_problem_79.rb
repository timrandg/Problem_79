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
  def test_histogram_r_counts_row_occurances
    data = Parse.new("../num_list.txt")
    assert_equal [{"1"=>1,"2"=>1,"3"=>1}, {"1"=>1,"4"=>1,"3"=>1}, {"1"=>1,"2"=>1,"4"=>1}, {"2"=>1,"3"=>1,"4"=>1}], data.histogram_r
  end
  def test_histogram_c_counts_col_occurances
    data = Parse.new("../num_list.txt")
    assert_equal [{"1"=>3, "2"=>1}, {"2"=>2, "4"=>1, "3"=>1}, {"3"=>2, "4"=>2}], data.histogram_c
  end

end

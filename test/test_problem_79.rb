$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

#requires all files in the lib folder
Dir.glob(File.dirname(__FILE__) + '/../lib/*'){|file| require file}
require "test/unit"

class TestProblem_79 < Test::Unit::TestCase
  def test_hello_from_tests
    puts "hello from tests"
  end
end

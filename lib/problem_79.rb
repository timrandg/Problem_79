

class Problem_79
end    

class Parse
  def initialize(file)
    @num_file = file
  end
  def rows
    lines = File.readlines(@num_file)
    lines = lines.compact.uniq
    lines = lines.select{|line| line.match(/^\d+$/)}
    lines = lines.collect{|line| line.chomp.split('')}
    lines = lines.collect{|arr| arr.map(&:to_i)}
  end
  def columns
    columns = rows.transpose
  end
  def histogram_c
    columns.collect do |r|
      nums = r.uniq
      totals = {}
      nums.each do |n|
        totals[n.to_s] = r.count(n)
      end
      totals
    end
  end
  def histogram_r
    rows.collect do |r|
      nums = r.uniq
      totals = {}
      nums.each do |n|
        totals[n.to_s] = r.count(n)
      end
      totals
    end
  end
end


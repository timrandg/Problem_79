

class Problem_79
end    

class Parse
  def initialize(file)
    @lines = File.readlines(file) ###
  end
  def rows
    lines = @lines.compact.uniq
    nums = lines.select{|line| line.match(/^\d+$/)}
    digits = nums.collect{|num| num.chomp.split('').map(&:to_i)}
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


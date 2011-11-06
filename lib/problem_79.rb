

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
    columns.collect do |c|
      histogram_hash_count_by(c)
    end
  end
  def histogram_r
    rows.collect do |r|
      histogram_hash_count_by(r)
    end
  end
  private
  def histogram_hash_count_by(x)
      uniq_nums = x.uniq
      totals = {}
      uniq_nums.each do |n|
        totals[n.to_s] = x.count(n)
      end
      totals
  end
end


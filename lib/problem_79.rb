class Parse
  def initialize(file)
    @lines = File.readlines(file)
  end
  def rows
    lines = @lines.uniq
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
  def summary_array_c
    summary = []
    columns.each do |c|
    column = Array.new(10){0}
      c.each do |d|
        column[d]+=1
      end
    summary << column
  end
    summary
  end
  def c_totals_by_digit
    summary_array_c.transpose.map{|arr| arr.inject{|s,n|s+n} }
  end
  def c_total_for(num)
    c_totals_by_digit[num]
  end
  def percentage_array_c
     fin = summary_array_c.collect do |arr_dig|
       arr_dig.collect.each_with_index do |dig,ind|
         if dig != 0  
            (dig/c_total_for(ind).to_f).round(4)  
         else
            dig
         end
       end
     end
  end
  def weighted_percentage_array_c
    require 'Matrix'
    percentage_array_c.transpose.collect do |m|
      (Matrix[m]*Matrix[[3],[2],[1]]).determinant
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


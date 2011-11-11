require 'matrix'

class Parse
  attr_accessor :rows, :columns

  def initialize(file)
    lines = File.readlines(file)
    nums = lines.uniq.select{|line| line.match(/^\d+$/)}

    @rows = nums.collect{|num| num.chomp.split('').map(&:to_i)}
    @columns = rows.transpose
  end
  

  def count_item_per_column
    #how many Bs are in column 1,2,3,etc.
    columns.map do |column|
      sum_column = Array.new(10){0} 
      sum_column.map.each_with_index{ |_, ind| column.count(ind) }
    end
  end

  def grand_total_in_all_columns
    count_item_per_column.transpose.map{|arr| arr.inject{|s,n|s+n} }
  end

  def grand_total_for(num)
    grand_total_in_all_columns[num]
  end

  def frequency_per_column
     count_item_per_column.collect do |count|
       count.collect.each_with_index do |dig,ind|
         if dig.zero?
            dig
         else
            (dig/grand_total_for(ind).to_f).round(2)  
         end
       end
     end
  end

  def weighted_score_for_each_digit
    frequency_per_column.transpose.collect do |m|
      (Matrix[m]*Matrix[*make_array_down_from(columns.length)]).determinant
    end
  end

  def give_answer
    weighted_score_for_each_digit.each_with_index.sort{|a,b|b<=>a}.collect{|a| a[1] unless a[0]==0}.join('').to_i
  end

  private
  def make_array_down_from(count)
    array = []
      count.times do
        array << [count]; count -= 1
      end
    array
  end
end


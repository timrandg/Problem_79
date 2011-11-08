require 'matrix'

class Parse
  attr_accessor :rows, :columns

  def initialize(file)
    lines = File.readlines(file)
    nums = lines.uniq.select{|line| line.match(/^\d+$/)}

    @rows = nums.collect{|num| num.chomp.split('').map(&:to_i)}
    @columns = rows.transpose
  end

  def sum_of_item_in_each_col
    total = []
    columns.each do |col|
      #one occurance for each digit, assume no occurances--0
      column = Array.new(10){0} 
        col.each do |digit|
          column[digit]+=1
        end
      total << column
    end
    total
  end

  def grand_total_of_item_for_all_columns
    sum_of_item_in_each_col.transpose.map{|arr| arr.inject{|s,n|s+n} }
  end

  def c_total_for(num)
    grand_total_of_item_for_all_columns[num]
  end

  def percentage_array_c
     fin = sum_of_item_in_each_col.collect do |arr_dig|
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
    percentage_array_c.transpose.collect do |m|
      (Matrix[m]*Matrix[*make_array_down_from(columns.length)]).determinant
    end
  end

  def give_answer
    weighted_percentage_array_c.each_with_index.sort{|a,b|b<=>a}.collect{|a| a[1] unless a[0]==0}.join('')
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


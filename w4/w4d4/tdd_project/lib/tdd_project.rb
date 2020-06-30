class Array

def my_uniq
    new_arr = []
    self.each do |ele|
        new_arr << ele if !new_arr.include?(ele)
    end
    new_arr
end


def two_sum
    new_arr = []
    self.each_with_index do |l1, i|
        self.each_with_index do |l2, j|
            new_arr << [i,j] if l1 + l2 == 0 && i < j 
        end
    end
    new_arr
end

def my_transpose
    transposed = []
    (0...length).each do |i|
        new_arr = []
        (0...length).each do |j|
            new_arr << self[j][i]
        end
        transposed << new_arr
    end
    transposed
end



def stock_picker
    indices = []
    maxprofit = 0
    self.each_with_index do |amt1, day1|
        self.each_with_index do |amt2, day2|
            profit = amt2 - amt1 
            if profit > maxprofit && day2 > day1
                maxprofit = profit 
                indices = [day1, day2]
            end
        end
    end
    indices
end

end
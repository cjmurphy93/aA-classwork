require "byebug"

class Array 
    def my_each(&prc)
        i = 0 
        while i < self.length 
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_arr = []

        self.my_each do |ele| 
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

     def my_reject(&prc)
        new_arr = []

        self.my_each do |ele| 
            new_arr << ele if !prc.call(ele)
        end
        new_arr
    end


    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        flatten_arr = []

        self.each do |ele|
            if ele.is_a?(Array)
                flatten_arr += ele.my_flatten
            else
                flatten_arr += [ele]
            end

        end
        flatten_arr
    end

    def my_zip(*arr)
        answer = Array.new(self.length){Array.new(arr.length + 1)}
        new_arr = [self] + arr
        (0...self.length).each do |idx1|
            (0...answer[0].length).each do |idx2|
                    answer[idx1][idx2] = new_arr[idx2][idx1]
            end
        end
        answer
    end


    def my_rotate(n=1)
        new_array = []
        self.each {|ele| new_array << ele}
        #debugger
        if n < 0 
            (n*-1).times do 
                new_array.unshift(new_array.pop)
            end
        else
            (n).times do 
                new_array.push(new_array.shift)
            end
            
        end
        return new_array
    end

    def my_join(ele=nil)
        joined = ""
        if ele.nil?
        self.each {|char| joined += char}
        return joined
        else
            self.each {|char| joined += char + ele}
            return joined[0...-1]
        end
    end

    def my_reverse
        i = self.length - 1
        new_arr = []
        while i >= 0
            new_arr << self[i]
            i -= 1
        end
        new_arr
    end

end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# # [1, 2] [ 4, 5, 6 ] [ 7, 8, 9 ] [10, 11, 12] [13, 14, 15]







# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true



# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


 # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # # => 1
# #      2
# #      3
# #      1
# #      2
# #      3

# p return_value  # => [1, 2, 3]
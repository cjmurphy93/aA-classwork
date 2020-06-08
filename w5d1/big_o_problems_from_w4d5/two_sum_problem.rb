require 'byebug'
# Brute force
def bad_two_sum?(list, target)
   
    list.each_with_index do |el1, i1|
        list.each_with_index do |el2, i2|
            return true if el1 + el2 == target && i1 != i2
        end
    end
    false
end

#O(n^2)
# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# Sorting
def oky_two_sum?(arr, target)
    sorted = arr.sort
   
end
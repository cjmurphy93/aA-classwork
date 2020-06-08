require 'byebug'

# Phase 1
# def my_min(list)
#     mini = 0
#     list.each do |i|
#         list.each do |j|
#             mini = i if i < j && i < mini
            
#         end
#     end
#     mini
# end
# O(n^2)

# #Phase 2
# def my_min(list)
#     list.inject do |acc, el|
#         if acc < el
#             acc
#         else
#             el
#         end
#     end
# end
# O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# # Phase 1
# def largest_contiguous_subsum(list)
#     subs = []
#     (0...list.length).each do |i|
#         (i...list.length).each do |j|
#         subs << list[i..j]
#         end       
#     end

#     subs.max_by {|sub| sub.sum}.sum

# end
# #This is pretty bad. I think its like O(n^3) but I could be wrong.

def largest_contiguous_subsum(list)
    # [2, 3, -6, 7, -6, 7]
    #largest[2,5,5,5,5,8]
    #current_sum[2,5,-3,1,1,8]
    largest = list[0]
    current_sum = 0
    i = 0
# return list[0] if list.length == 1
# debugger
    list.each do |ele|
        current_sum += ele
        if current_sum > largest
            largest = current_sum
        elsif current_sum < largest
            current_sum -= list[i]
            i += 1
            largest = current_sum if current_sum > largest
        end
    end

    largest

end

#this is O(n), but I don't know the space somplexity that well, but I think its O(1)

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

list=[-5, 1, 2, 3, 4, -5, 9, 9]
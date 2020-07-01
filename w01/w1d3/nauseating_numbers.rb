require 'byebug'

def strange_sums(arr)
    count = 0
    arr.each_with_index do |num1, idx1|
        arr.each_with_index do |num2, idx2|
            if idx2 > idx1 && num1 + num2 == 0
                count += 1
            end
        end
    end
    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(arr, num)
    arr.each_with_index do |num1, idx1|
        arr.each_with_index do |num2, idx2|
            if idx2 > idx1 && num1 * num2 == num
                return true
            end
        end
    end
    return false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |char|
        if hash.has_key?(char)
            new_str += char * hash[char]
        else 
            new_str += char
        end
    end
    new_str

end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
    (0..num).each do |n|
        if n * n == num
            return true
        end
    end
    false

end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def anti_prime?(num)
    i = 1
    max_factors = []
    (1..num).each do |n|
        factors = []
        (1..n).each do |n2|
            if n % n2 == 0
                factors << n2
            end
        end
        if factors.length > max_factors.length
            i = factors[-1]
            max_factors = factors
        end
    end
    return i == num
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(mtx1, mtx2)
    arr = []
    mtx1.each_with_index do |arr1, idx1|
        mtx2.each_with_index do |arr2, idx2|
            if idx1 == idx2
                temp_arr = []
                temp_arr << arr1[0] + arr2[0]
                temp_arr << arr1[1] + arr2[1]
                arr << temp_arr
            end
        end
    end
    arr
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    factors = []
    nums.each do |num|
        factors << divisor_check(num)
    end
    factors.inject {|acc, el| acc & el}
end

def divisor_check(num)
    arr = []
    (1..num).each do |n|
        if num % n == 0
            arr << n
        end
    end
    arr
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    trib = [1, 1, 2]
    if num > 3
        num.times do
            trib << trib[-1] + trib[-2] + trib[-3]
        end
    end
    return trib[num-1]

end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*mtx)
    height = mtx[0].length
    width = mtx[0][0].length
    answer = Array.new(height){Array.new(width, 0)}
    mtx.each do |matrix|
        (0...height).each do |vert|
            #debugger
            (0...width).each do |horiz|
                return nil if matrix.length != height || matrix[0].length != width
                answer[vert][horiz] += matrix[vert][horiz]
            end
        end
    end
    answer
        
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
    same_row = false
    same_col = false
    height = arr.length

    arr.each do |row|
        if row.all?{|ele| ele == row[0]}
            same_row = true
        end
    end

    (0...height).each do |col|
        temp = []
        (0...height).each do |row|
            temp << arr[row][col]
        end
        if temp.all?{|ele| ele == temp[0]}
            same_col = true
        end
    end

    same_row || same_col
             

end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(arr)
    right_diag = []
    left_diag = []
    height = arr.length
    (0...height).each do |row|
        right_diag << arr[row][row]
    end

    x = 0
    y = height - 1
    while x < height
        left_diag << arr[y][x]
        y -= 1
        x += 1
    end
    
    right_diag.all? {|ele| ele == right_diag[0]} || left_diag.all? {|ele| ele == left_diag[0]}
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false ``

def pascals_triangle(num)
    triangle = []
    i = 1
    while triangle.length < num
        row = [1]
        y = i
        while row.length < i
            x = 0
            while row.length < i - 1
              #y = 3 i = 3   
            #triangle[2][1] == triangle[1][0] + triangle[1][1]
                row << triangle[y - 2][x] + triangle[y - 2][x + 1]
            #triangle[3][1] == triangle [2][0] + triangle[2][1]
            #triangle[3][2] == triangle[2][1] + triangle[2][2]
            x += 1
            end
            row << 1
        end
        triangle << row
        i += 1
    end
    triangle
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

def is_prime?(num)
    if num < 2
        return false
    end

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true
end


def mersenne_prime(num)
    
    i = -1
    count = 0
    while count < num
        i += 1
        x = 2**i - 1
        if is_prime?(x) 
            count += 1
        end
    end
    2**i - 1
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(word)
    alpha = ("a".."z").to_a
    sum = 0
    word.each_char do |char|
        sum += alpha.index(char) + 1
    end
    triangular_num?(sum)
end

def triangular_num?(num)
    i = 1
    while ((i * (i + 1)) / 2) < num
        i += 1
    end
    return ((i * (i + 1)) / 2) == num
end



# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(arr)
    new_arr = arr
    done = false
    
    while !done
        done = true
        (0...new_arr.length - 1).each do |i|
            if  new_arr[i] + 1 == new_arr[i + 1] || new_arr[i + 1] + 1 == new_arr[i]
                new_arr = new_arr[0...i] + new_arr[i + 2..-1]
                done = false
                break
            end
        end
    end
    
    new_arr
end

#   arr
#   arr[i] + 1 == arr[i + 1] || arr[i + 1] + 1 == arr[i]

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(arr, n)
    new_arr = []

    arr.each do |num|
       

        if n > 0
            count = 0
            i = num + 1
            while count < n
                if is_prime?(i)
                    count += 1
                    i += 1
                else
                    i += 1
                end
            end
            new_arr << i - 1
        elsif n < 0
            count = 0
            i = num - 1
            while count > n
                if is_prime?(i)
                    count -= 1
                    i -= 1
                elsif i < 1
                    break
                else
                    i -= 1
                end
            end 
             if i > 0
                new_arr << i + 1
             else
                new_arr << nil
             end
        end          

        
    end

    new_arr
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]


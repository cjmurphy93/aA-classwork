def proper_factors(num)
    arr = []
    (1...num).each do |n|
        arr << n if num % n == 0 
    end
    arr   
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(n)
   arr = []
    i = 1
    while arr.length < n
        if perfect_number?(i)
            arr << i
        end
        i += 1
    end
    return arr
end
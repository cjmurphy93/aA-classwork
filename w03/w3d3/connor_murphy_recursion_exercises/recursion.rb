require 'byebug'

def range(min, max)
    return [] if max <= min

    [min] + range(min + 1, max)
end

#p range(1, 5)

def exponentiation(base, exp)
    #Recursion 1
    # return 1 if exp == 0
    # base * exponentiation(base, exp - 1)

    #Recursion 2
    return 1 if exp == 0
    return base if exp == 1
    if exp % 2 == 0
        pow = exponentiation(base, exp / 2)
        pow *= pow
    else
        pow =  exponentiation(base, (exp - 1) / 2)
        pow = base * pow * pow
    end
    pow
end

# p exponentiation(2, 4)

class Array

    def deep_dup

        new_arr = []
        self.each do |ele| 
            if ele.is_a?(Array)
                new_arr << ele.deep_dup
            else
                new_arr << ele
            end
        end
        new_arr
    end
end
 

# p a = [1, [2], [3, [4]]]
# p a.object_id
# p b = a.deep_dup
# p b.object_id
# p a[1] << 3
# p a 
# p b


def fibonacci(n)
    return [] if n == 0
    return [1] if n == 1
    # return [1, 1] if n == 2

    # prev_nums = fibonacci(n-1)
    # prev_nums << prev_nums[-1] + prev_nums[-2]
    # prev_nums

    new_arr = [1, 1]

    (n-2).times { new_arr << new_arr[-1] + new_arr[-2] }
    
    new_arr
end

# p fibonacci(20)



def bsearch(array, target)
    mid_point = array.length / 2
    check = array.length / 2
    #debugger
    return 0 if target == array[0] 
    return nil if array.length == 1
    #debugger
    if target == array[mid_point]
    return mid_point 
    elsif array[mid_point] < target
        upper = bsearch(array[mid_point..-1], target)
        upper ||= 0
        mid_point += upper 
    else
        lower = bsearch(array[0...mid_point], target)
        lower ||= 0
        mid_point -= lower
    end
    
    if mid_point == check
        return nil
    else
        return mid_point
    end


end

def merge_sort(array)
    return array if array.length <= 1
    mid_point = array.length / 2
    #debugger
    merge(merge_sort(array[0...mid_point]), merge_sort(array[mid_point..-1]))
end

def merge(arr1, arr2)
    new_arr = []
    i = 0
    j = 0
    while (arr2[j] != nil && arr1[i] != nil) 
        if arr1[i] < arr2[j] 
            new_arr += [arr1[i]]
            i += 1
        else
            new_arr += [arr2[j]]
            j += 1
        end
    end
     #debugger
    if arr2[j] == nil
        if arr1.length == 1
            new_arr += arr1
        else
        arr1[i..-1].inject(arr1[i]) do |acc, ele|
            if acc < ele 
                new_arr += [acc]
                ele 
            else
                new_arr += [ele]
            acc
            end
        end
        end
    end
    #debugger
    if arr1[i] == nil
        if arr2.length == 1
            new_arr += arr2
        else
        arr2[j..-1].inject(arr2[j]) do |acc, ele|
            if acc < ele 
                new_arr += [acc]
                ele 
            else
                new_arr += [ele]
                acc
            end
        end
        end
    end
                
    new_arr
end


p merge_sort([9, 7, 3, 1, 6, 7])

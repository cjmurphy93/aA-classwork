# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    return true
end

def largest_prime_factor(num)
    factors = []
    (1..num).each do |i|
        if is_prime?(i) && num % i == 0
            factors << i
        end
    end
    return factors.max
end

def unique_chars?(str)
    new_hash = Hash.new(0)
    str.each_char do |char|
        new_hash[char] += 1
    end
    new_hash.each do |k, v|
        if v >= 2
            return false
        end
    end
    return true
end

def dupe_indices(arr)
    # new_hash = Hash.new([])
    # arr.each_with_index do |ele1, idx1|
    #     arr.each_with_index do |ele2, idx2|
    #         if ele1 == ele2
    #             new_hash[ele1] += [idx1]
    #         end
    #     end
    # end
    # new_hash
    new_hash = Hash.new(0)
    answer = Hash.new([])
    arr.each do |char|
        new_hash[char] += 1
    end
    new_hash.each do |k, v|
        if v >= 2
            answer[k] += []
        end
    end
    arr.each_with_index do |ele, idx|
        if answer.has_key?(ele)
            answer[ele] += [idx]
        end
    end
    return answer
end

def ana_array(arr1, arr2)
    new_hash1 = Hash.new(0)
    new_hash2 = Hash.new(0)

    arr1.each do |ele1|
        new_hash1[ele1] += 1
    end

    arr2.each do |ele2|
        new_hash2[ele2] += 1
    end

    new_hash1 == new_hash2
end

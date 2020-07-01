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

def nth_prime(num)
    count = 0
    i = 2
    while count < num
        if is_prime?(i)
            count += 1
        end
        i += 1
    end
    return i - 1
end

def prime_range(min, max)
    arr = []
    (min..max).each do |num|
        arr << num if is_prime?(num)
    end
    arr
end
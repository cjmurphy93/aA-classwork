def partition(arr, num)
    small_arr = []
    large_arr = []
    arr.each do |n|
        if n < num
            small_arr << n
        else
            large_arr << n
        end
    end
    return [small_arr, large_arr]
end

def merge(hash1, hash2)
    hash3 = {}
    hash3 = hash1.merge(hash2)
    hash3
end

def censor(sent, arr)
    vowels = "aeiouAEIOU"
    words = sent.split
    words.each do |word|
        if arr.include?(word.downcase)
            word.each_char.with_index do |char, idx|
                if vowels.include?(char)
                    word[idx] = "*"
                end
            end
        end
    end
    words.join(" ")
end

def power_of_two?(num)
    while (num % 2 == 0) && (num != 0)
        num /= 2
    end
    num == 1
end
require "byebug"

def zip(*arr)
    length = arr.first.length       #

    (0...length).map do |i|         # [ [], , , ]
        arr.map {|sub| sub[i]}      # sub[0]
    end
end

def prizz_proc(array, prc_1, prc_2)
   array.select { |ele| prc_1.call(ele) ^ prc_2.call(ele) }
end

def zany_zip(*arr)
    new_arr = arr.sort_by(&:size)
    length = new_arr[-1].length
    (0...length).map do |i|
        arr.map {|sub| sub[i]}
    end
end

def maximum(array, &prc)
    return nil if array.length < 1

    array.inject do |acc, ele|
        if prc.call(acc) > prc.call(ele)
            acc
        else
            ele
        end
    end
end

def my_group_by(arr, &prc)
    result = Hash.new([])
    arr.each do |ele|
        k = prc.call(ele)
        result[k] += [ele]
    end
    result
end


def max_tie_breaker(array, prc, &blk)
    return nil if array.length < 1

    array.inject do |acc, ele|
        if blk.call(acc) < blk.call(ele)
            ele
        elsif blk.call(acc) == blk.call(ele)
            if prc.call(acc) < prc.call(ele)
                ele
            else
                acc
            end
        else
            acc
        end
    end 
end

def silly_syllables(sent)
    words = sent.split
    new_words = []

    words. each do |word|
        new_words << converter(word)
    end

    new_words.join(" ")
end

def converter(word)
    vowels = "aeiouAEIOU"
    count = 0

    word.each_char { |char| count += 1 if vowels.include?(char) }
    return word if count < 2
    idx2 = -1
    word.each_char.with_index do |char1, idx1|
        if vowels.include?(char1)
            while !vowels.include?(word[idx2]) 
                idx2 -=1
            end 
            
            return word[idx1..idx2]
        end
    end
end


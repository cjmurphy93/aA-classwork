def average(num_1, num_2)
    (num_1 + num_2)/ 2.0
end

def average_array(arr)
    (arr.sum * 1.0) / arr.length
end

def repeat(str, num)
    newstr = ""
     num.times do
        newstr += str
    end
    newstr
end

def yell(str)
    str.upcase! + "!"
end

def alternating_case(str)
    words = str.split
    words.each_with_index do |word, idx|
        if idx.even?
            word.upcase!
        else
            word.downcase!
        end
    end
    return words.join(" ")
end
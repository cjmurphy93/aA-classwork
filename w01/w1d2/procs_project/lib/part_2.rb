def reverser(str, &prc)
prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split
    new_arr = []
    words.each do |word|
        new_arr << prc.call(word)
    end
    # words.map {|word| prc.call(word)}
    new_arr.join(" ")
end

def greater_proc_value(n, prc1, prc2)
    new_arr = []
    new_arr << prc1.call(n)
    new_arr << prc2.call(n)
    return new_arr.max
end
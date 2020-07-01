def element_count(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    hash
end

def char_replace!(str, hash)
    (0...str.length).each do |idx|
        if hash.has_key?(str[idx])
            str[idx] = hash[str[idx]]
        end
    
    end
    str
end

def product_inject(arr)
    arr.inject(:*)
end
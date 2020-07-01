def palindrome?(str)
    str == reverse_order(str)
end

def reverse_order(str)
    new_str = ""
    i = str.length - 1
    while i >= 0
        new_str += str[i]
        i -= 1
    end
    new_str
end

def substrings(str)
    result = []
    i = 0
    while i <= str.length - 1
        j = i
        while j <= str.length - 1
            result << str[i..j]
            j += 1
        end
        i += 1
    end
    result

end

def palindrome_substrings(str)
    subs = substrings(str)
    subs.select{|word| palindrome?(word) && word.length > 1}
end
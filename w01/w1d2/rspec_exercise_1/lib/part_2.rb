def hipsterfy(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    re_word = word.reverse
    re_word.each_char.with_index do |char, i|
        if vowels.include?(char)
            new_word += re_word[0..(i-1)] + re_word[(i+1)..-1]
            return new_word.reverse
        end
     end
    word
end

def vowel_counts(str)
new_hash = Hash.new(0)
vowels = "aeiouAEIOU"

    str.each_char do |char|
        if vowels.include?(char)
            new_hash[char.downcase] += 1
        end
    end
    new_hash
end

def caesar_cipher(str, n)

    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""
    str.each_char do |char|
        if alphabet.include?(char)
            old_index = alphabet.index(char)
            new_index = old_index + n
            new_str += alphabet[new_index % 26]
        else
            new_str += char
        end
    end
    return new_str
end


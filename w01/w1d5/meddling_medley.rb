def duos(str)
    count = 0

    (0...str.length - 1).each do |idx|
        count += 1 if str[idx] == str[idx + 1]
    end
    
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
    words = sent.split

    words.map! do |word| 
        if hash.has_key?(word)
            hash[word]
        else
            word
        end
    end

    words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc, &blk)
    new_hash = {}

    hash.each { |k, v| new_hash[blk.call(k)] = prc.call(v) }
    
    new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
    new_arr = []

    str.each_char.with_index do |char1, idx1|
        count = 1

        str.each_char.with_index do |char2, idx2|
            count += 1 if (char1 == char2 && idx1 < idx2)
        end

        if count > 2 && !new_arr.include?(char1)
            new_arr << char1
        end
    end

    new_arr
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
    return false if str.length < 3

    (0...str.length - 2).each do |i|
        return true if str[i] == str[i + 1] && str[i] == str[i + 2]
    end

    false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
    new_str = ""
    str.each_char do |char|
        if char == " "
            new_str += char
        elsif hash.has_key?(char)
            new_str += hash[char]
        else
            new_str += "?"
        end
    end
    new_str

end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    new_str = ""
    (0...str.length - 1).each do |i|
        # if i.even?
            char = str[i]
            num = str[i + 1].to_i
            # num.times do 
                new_str += char * num
        #     end
        # end
    end
    new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'


def conjunct_select(array, *prcs)
    array.select { |ele| prcs.all? { |prc2| prc2.call(ele) } }
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
    words = sent.split
    new_arr = []

    words.each do |word|
        if word.length < 3
            new_arr << word
        elsif word[0] == word[0].upcase
            new_arr << pig_latin(word.downcase).capitalize
        else
            new_arr << pig_latin(word)
        end
    end

    new_arr.join(" ")

end

def pig_latin(word)
    vowels = "aeiouAEIOU"

    return word + "yay" if vowels.include?(word[0])

    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            return word[idx..-1] + word[0...idx] + "ay"
        end
    end

end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(str)
    words = str.split
    new_arr = []

    words.each do |word|
        if word.length < 3
            new_arr << word
        elsif word[0] == word[0].upcase
            new_arr << convert(word.downcase).capitalize
        else
            new_arr << convert(word)
        end
    end

    new_arr.join(" ")

end

def convert(word)
    vowels = "aeiouAEIOU"

    return word + word if vowels.include?(word[-1])
    word.reverse.each_char.with_index do |char, idx|
        if vowels.include?(char)
            return word + word[((idx + 1) * - 1)..-1]
        end
    end
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *prcs)
    array.select { |ele| prcs.any? { |prc2| prc2.call(ele) } }
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
    words = sent.split
    new_words = []

    words.each_with_index do |word, idx|
        if idx.even?
            new_words << vowel_remove(word)
        else
            new_words << vowel_remove(word.reverse).reverse
        end
    end

    new_words.join(" ")
end

def vowel_remove(word)
    vowels = "aeiouAEIOU"

    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            return word[0...idx] + word[idx + 1..-1]
        end
    end
    word
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
    words = sent.split

    vowels = "aeiouAEIOU"
    new_words = []

    words.each do |word|
        if vowels.include?(word[-1])
            new_words << word + word[-1]
        elsif word[0] == word[0].upcase
            new_words << silly(word.downcase).capitalize
        else
            new_words << silly(word)
        end
    end
    
    new_words.join(" ")
end

def silly(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            new_word += (char + "b" + char).downcase
        else
            new_word += char
        end
    end
    return new_word
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


def compress(str)
    new_str = ""
    i = 0
    count = 0
    while i < str.length
        char = str[i]
        count = 1
        i += 1
        
        while char == str[i]
            count += 1
            i += 1
        end

        if count > 1
            new_str += char + count.to_s
        else
            new_str += char
        end
    end
   

    new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"


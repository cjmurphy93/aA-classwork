def all_words_capitalized?(arr)
    arr.all? {|word| word == word.capitalize}
end

def valid_url(word)
    parts = word.split(".")
    endings = ["io", "com", "net", "org"]
    endings.include?(parts[-1])
end

def no_valid_url?(arr)
    arr.none? {|url| valid_url(url)}
end

def any_passing_students?(arr)
    arr.any? {|student| (student[:grades].sum / student[:grades].length) >= 75  }
end


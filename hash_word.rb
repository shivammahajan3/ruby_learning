def hash_word_count(string)
    count = {}
    str_arr = string.split
    str_arr.each do |word|
        len = word.length
        count[word] = len
    end
    return count
end

str = "I am working in bestpeers"
puts hash_word_count(str)
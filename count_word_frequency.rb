def word_frequency(arr_string)
    word_freq = arr_string.join(" ").downcase.split.tally
end

sentences = ["Hello world", "hello Ruby", "Ruby is awesome", "World is big"]
puts word_frequency(sentences)
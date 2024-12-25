class WordFrequency
    attr_accessor :arr_string

    def initialize(arr_string)
        @arr_string = arr_string
    end

    def all_word_frequency
        arr_string.join(' ').downcase.split.tally
    end

    def word_frequency(key)
        all_word_frequency[key.downcase] || 0  # returns 0 if word is not found
    end
end

words_str = ["Hello world", "hello Ruby", "Ruby is awesome", "World is big"]
sentence_arr = WordFrequency.new(words_str)

puts sentence_arr.all_word_frequency   # => {"hello"=>2, "world"=>2, "ruby"=>2, "is"=>2, "awesome"=>1, "big"=>1}
puts sentence_arr.word_frequency("hello")  # => 2
puts sentence_arr.word_frequency("ruby")   # => 2
puts sentence_arr.word_frequency("python") # => 0
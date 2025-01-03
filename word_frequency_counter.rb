class WordFrequencyCounter
  def initialize(input)
    @input = input
  end
  
  def word_frequency_counter
    word_arr = []
    stack = [@input]
    while !stack.empty?
      element = stack.pop
      if element.is_a? String
        word_arr.push(element)
      elsif element.is_a? Array
        stack.push(*element)
      elsif element.is_a? Hash
        stack.push(*element.keys.map{|ele| ele.to_s})
        stack.push(*element.values)
      end
    end
    split_words(word_arr).tally
  end
end

input_str = ["Hello world, welcome to Ruby!"]
counter = WordFrequencyCounter.new(input_str)
p counter.word_frequency_counter

input_hash = {
  "hello world" => "Ruby is fun",
  details: {
    description: "Ruby rocks in the programming world",
    :"extra info" => ["hello again", "world of Ruby"]
  }
}
counter = WordFrequencyCounter.new(input_hash)
p counter.word_frequency_counter

input_arr = [
  "Hello world",
  { 
    "Ruby language" => "is fun",
    details: [
      "Ruby rocks", 
      { "hello again" => "world is round" }
    ]
  },
  [
    "Complex structures are interesting",
    { more_data: ["Hello", "world of Ruby"] }
  ]
]

counter = WordFrequencyCounter.new(input_arr)
p counter.word_frequency_counter

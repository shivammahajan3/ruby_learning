def word_frequency_counter(input)
    word_arr = []
    stack = [input]
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

  char_arr = []
  word_arr.each do |word|
    word = word.gsub(/["!.,"]/,"").downcase
    word.split.each do |seprate|
      char_arr.push(seprate)
    end
  end

  char_arr.tally

end

input_str = "Hello world, welcome to Ruby!"
p word_frequency_counter(input_str)
# {
#   "hello" => 1,
#   "world" => 1,
#   "welcome" => 1,
#   "to" => 1,
#   "ruby" => 1
# }

input_hash = {
  "hello world" => "Ruby is fun",
  details: {
    description: "Ruby rocks in the programming world",
    :"extra info" => ["hello again", "world of Ruby"]
  }
}

p word_frequency_counter(input_hash)
# {
#   "hello" => 2,
#   "world" => 3,
#   "ruby" => 3,
#   "is" => 1,
#   "fun" => 1,
#   "rocks" => 1,
#   "in" => 1,
#   "the" => 1,
#   "programming" => 1,
#   "extra" => 1,
#   "info" => 1,
#   "again" => 1,
#   "of" => 1
# }

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

p word_frequency_counter(input_arr)

# {
#   "hello" => 4,
#   "world" => 4,
#   "ruby" => 3,
#   "language" => 1,
#   "is" => 2,
#   "fun" => 1,
#   "rocks" => 1,
#   "again" => 1,
#   "round" => 1,
#   "complex" => 1,
#   "structures" => 1,
#   "are" => 1,
#   "interesting" => 1,
#   "of" => 1
# }

# return a hash listing each substring (case insensitive) that was found in the original string 
# and how many times it was found.

def substrings(string, dict)
    hash = {}
    string = string.downcase

    dict.each do |word|
        word = word.downcase
        count = string.scan(word).length
        if count > 0
            hash[word] = count
        end
    end
    hash
end

dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dict)  # { "below" => 1, "low" => 1 }

puts substrings("Howdy partner, sit down! How's it going?", dict)
# { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

# Write a Ruby program to find the longest substring and it's length in a given string 
# that contains only unique characters.
# For example: `pwwkew`
# Output: `wke`, 3

class LongestSubstring

    def initialize(string)
        @string = string
    end

    def longest_substring
        final_substring = ""
        length = 0
        
        (0...@string.length).each do |start_index|
            (start_index...@string.length).each do |end_index|
                substring = @string[start_index..end_index]
                if substring.chars.uniq.length == substring.length
                    if substring.length > length
                        final_substring = substring
                        length = substring.length
                    end
                end
            end
        end
        [final_substring,length]
    end
end

string = LongestSubstring.new('pwkew')
p string.longest_substring

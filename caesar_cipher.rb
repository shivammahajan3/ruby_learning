# It is a type of substitution cipher in which each letter in the plaintext is replaced by a 
# letter some fixed number of positions down the alphabet. 
# For example, with a left shift of 3, D would be replaced by A, E would become B, and so on

def caesar_cipher(string, shift)
    alphabet_arr = ('a'..'z').to_a
    result = ""
    
    string.each_char do |ch|
        if ch >= 'a' && ch <= 'z'
            index = alphabet_arr.index(ch)
            index = (index + shift) % 26
            result += alphabet_arr[index]
        elsif ch >= 'A' && ch <= 'Z' 
            index = alphabet_arr.index(ch.downcase)  
            index = (index + shift) % 26
            result += alphabet_arr[index].upcase 
        else
            result += ch 
        end
    end
    result
end

puts caesar_cipher("What a string", 5)  # O/P   "Bmfy f xywnsl!"

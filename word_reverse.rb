def rev(str)
    len = str.length
    string = ""
    (len-1).downto(0).each do |i|
        string += str[i]
    end
    return string
end

def my_split(string,seprator)
    len = string.length
    string_arr = []
    new_str = ""
    (0...len).each do |i|
        if(i == len - 1)
            new_str += string[len-1] 
            string_arr.push(new_str)
        end
        if(string[i] == seprator)
            string_arr.push(new_str)
            new_str = ""
        else
            new_str += string[i]
        end
    end
    return string_arr
end

def word_reverse(string)
    string_arr = my_split(string, ' ')
    result = ""
    string_arr.each do |word|
        char = rev(word)
        result = result + char + " "
    end
    result.strip
end


puts "#{word_reverse("I am working in bestpeers")}"   #  O/P    =>   "I ma gnikrow ni sreeptseb"
# input,output and variables in Ruby

puts "Enter Your Name : "

#it automatically removes the newline character from the end of the input string.
name = gets.chomp  

puts "Enter Your age : "

#gets method reads a line of input from the user,including the newline character at the end.
age = gets.to_i  

# it will print name and age in the console.
puts "Your Name is #{name} and Your age is #{age}" 

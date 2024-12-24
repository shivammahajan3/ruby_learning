# Write a Ruby program that reads a file named "number.txt" containig a list of numbers,
# one per line and calculates the sum of all the numbers

numbers_file = File.new("number.txt", 'w+')

loop do
  puts "Enter a number or press 'Y' to stop:"
  input = gets.chomp
  break if input.downcase == 'y'

  numbers_file.puts(input)
end

numbers_file.close 

sum = 0
File.foreach("number.txt") do |line|
  sum += line.to_i
end

puts "The sum of all numbers is #{sum}"

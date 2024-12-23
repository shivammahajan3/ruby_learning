file = File.new("student.txt", "a+")

loop do
  puts "Enter student data for inserting (type 'y' to stop):"
  data = gets.chomp

  break if data.downcase == 'y'

  file.puts(data)
end

file.rewind

puts "\nAll student data:"
File.foreach('student.txt') do |line|
  puts line
end

file.close


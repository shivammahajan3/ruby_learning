# Appending data to a File

puts "Enter Teacher data "
data = gets.chomp
File.open('teachers.txt', 'a') do |file|
    file.puts(data)
end

File.foreach("teachers.txt") do |line|
    puts line
end

# file information
file_name = 'teachers.txt'
puts "File size: #{File.size(file_name)} bytes"
puts "File type: #{File.ftype(file_name)}"
puts "File directory: #{File.dirname(file_name)}"
puts "File extension: #{File.extname(file_name)}"
puts "File created at: #{File.ctime(file_name)}"
puts "File modified at: #{File.mtime(file_name)}"
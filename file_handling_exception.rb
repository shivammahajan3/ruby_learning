# New teacher file will created 

file2 = File.new("teachers.txt","w+")

puts "Enter the teachers related data"
data = gets.chomp
file2.puts(data)
begin 
    file2.readline(10)
rescue IOError => e
    puts "Error: #{e}"
ensure
    file2.close
end
# Checking a file existence and copy content to another file

if File.exist?("teachers.txt")
    puts "File Found..."
    teacher_file = File.open("teachers.txt", "r")
    school_file = File.open("school_teacher.txt", "w")

    teacher_file.each_line do |line|
        school_file.puts(line)
    end

    teacher_file.close
    school_file.close

    school_file = File.open("school_teacher.txt", "r")
    school_content = school_file.readlines
    puts school_content

else
    puts "File Not Found...!"
end

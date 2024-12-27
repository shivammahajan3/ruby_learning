str = 'hello world'
puts str.reverse   # Output: "dlrow olleh"

# Monkey Patching String class override the string reverse method
class String
  def reverse
    self.split(' ').reverse.join(' ')
  end
end

str = 'hello world'
puts str.reverse   # Output: 'world hello'
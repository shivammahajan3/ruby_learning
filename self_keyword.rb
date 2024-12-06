# Using self keyword refers to the current object

class Person

    def initialize(name)
        @name = name
    end

    # Class level Method means it will be called without creating an instance
    def self.eat
        puts "I'm eating some chips!"
    end

    # Instance method
    def sing
        puts "#{@name} is singing very well!"
    end

end

# Calling the class method
Person.eat  # Outputs: I'm eating some chips!

# Creating an instance of class
p1 = Person.new("Robot")
p1.sing

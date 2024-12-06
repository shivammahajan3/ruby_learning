# Single Inheritance in Ruby

class Animal

    def eat
        puts "Eating meat!"
    end

end

class Dog < Animal

    def initialize(name)
        @name = name
    end

    def speak
        puts "#{@name} speak Woof Woof!!"
    end

end

dog = Dog.new("Cheems")
dog.eat
dog.speak
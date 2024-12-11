# Multiple Inheritance

module Animal
    def eat
        puts "Eating"
    end

    def walk
        puts "Walking"
    end
end

module Dog
    def bark
        puts "Woof Woof!!"
    end
end

module Bulldog
    def bark
        puts "Bull Bull!!"
    end
end

class Puppy
    include Animal   # This will add method as instance level method
    include Dog
    extend Bulldog  # This will add method as Class level method
    
    def name
        puts "My name is Cheems!!"
    end
end

p1 = Puppy.new
p1.eat
p1.walk
p1.bark
p1.name
Puppy.bark
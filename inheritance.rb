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
# dog.eat
# dog.speak

# Multilevel Inheritance 

class Father
    def name
        puts "My Son Name is Salmon"
    end
end

class Mother < Father
    def surname
        puts "Suraname is Bhoi"
    end
end

class Child < Mother

    def my_name
        puts "My name is Salmon Bhoi"
    end
end

c1 = Child.new
# c1.name
# c1.surname
# c1.my_name


# Hierarchical Inheritance 

class Grandfather
    def my_family
        puts "My Family"
    end
end

class Fatherr < Grandfather
    def me
        puts "It's Me"
    end
end

class Son < Grandfather
    def myself
        puts "Only Me"
    end
end

son = Son.new
son.my_family

father = Fatherr.new
father.my_family

=begin 
    Duck-typing is a kind of polymorphism. 
    Polymorphism is the ability of different objects to respond in different ways 
    to the same message 
=end

class Horse
  def speak
    'Neigh Neigh!'
  end
end

class Cat
  def speak
    'Meow Meow!'
  end
end

class Dog
  def speak
    'Woof Woof!'
  end
end

class Bird
  def speak
    'Tweet Tweet!'
  end
end

all_animals = [Horse.new, Cat.new, Dog.new, Bird.new]

all_animals.each do |animal|
  puts animal.speak
end

require_relative "./validations.rb"
require "byebug"

class User
  attr_accessor :name
end

class Employee
  attr_accessor :name
end

employee = Employee.new
employee.name = "Shivam"

class Person < CustomActiveRecord::Base
  attr_accessor :age, :name, :owner

  validate :name, presence: true, length: { in: 3..10 }
  # validate :name, length: { minimum: 5 }
  validate :age, presence: true
  validate :name, format: /Cats(.*)/
  validate :owner, type: User
  # validate :age, length: { minimum: 18, maximum: 65 }
  # validate :age, length: { minimum: 10 }
  # validate :age, length: { maximum: 50 }
  # validate :age, length: { in: 6..20 }
  validate :age, length: { is: 6 }
end

person = Person.new
person.name = "Cheems"
person.age = 5
person.owner = employee
p person.valid? # false (because name is invalid as per regex)
person.validate! # Raises ValidateError: Name is invalid., For owner type User doesn't match

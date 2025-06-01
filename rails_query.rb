require "byebug"

class User
  ATTRIBUTES = [:name, :email, :id]

  attr_reader *ATTRIBUTES

  @@users = []
  @@user_ids = 0

  def initialize(name:, email:)
    @name = name
    @email = email
    @id = @@user_ids += 1
    @@users << self
  end

  class << self

    ATTRIBUTES.each do |method|
      define_method("find_by_#{method}") do |value|
        @@users.find { |user| user.send(method) == value }
      end
    end

    def all
      @@users
    end

    def where(**args)
      @@users.select do |user|
        args.all? { |attr, val| user.send(attr) == val }
      end
    end

  end

end

user1 = User.new(name: "rahul", email: "rahul@testing.com")
user2 = User.new(name: "aadiiii", email: "aadiiii@testing.com")
user3 = User.new(name: "shivam", email: "shivam@testing.com")
user4 = User.new(name: "shivam", email: "shivam@example.com")

puts User.all.inspect

puts User.find_by_email("shivam@testing.com").inspect    # return user3
puts User.find_by_name("aadiiii").inspect                # return user2
puts User.find_by_email("google.com").inspect            # return nil
puts User.find_by_id(1).inspect                          # return user1

puts User.where(name: "shivam").inspect                  #return user3 and user4x

puts User.where(name: "shivam", email: "shivam@testing.com").inspect    #return only user3

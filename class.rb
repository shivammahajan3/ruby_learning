# Class in Ruby

#Creating a User class
class User
    # this method we call automatically when User.new
    def initialize(name,email,password)
        @name = name
        @email = email
        @password = password
    end

    # User class method
    def display_user_info
        puts "User = #{@name} UserEmail = #{@email} UserPassword = ****"
    end

end

# Creating a object of User class 
shivam = User.new("Shivam", "shivam@gmail.com", "passowrd")

#calling display_user_info method using instance
shivam.display_user_info()

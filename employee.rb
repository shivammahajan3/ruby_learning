class Employee
   @@employees = {username: "shivam",password: "password123"}
   
   def self.login(username,password)
       return true if @@employees[:username] == username && @@employees[:password] == password
       false
   end
   
end
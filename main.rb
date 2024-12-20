require_relative 'account'
require_relative 'transaction'

puts "-------------------------------"
puts "Welcome to the Bank (^^)"
puts "-------------------------------"

Account.create_dummy_accounts

loop do
    puts "-------------------------------------"
    puts "Select option in Number 1, 2, 3 or 4"
    puts "-------------------------------------"
    puts "1. Create New Account"
    puts "2. Search Customers"
    puts "3. Transaction"
    puts "4. All Customer Details"
    puts "5. Exit"

    option = gets.to_i
    begin
        case option
        when 1
            puts "Enter Your Name"
            name = gets.chomp.strip
            raise "Please enter valid name [!constains only characters!]" if !name.match?(/^[a-zA-Z\s]+$/)
            puts "Enter aadhar Number"
            aadhar = Integer(gets.chomp)
            if aadhar.digits.length == 12
                puts "Deposit Initial Fund"
                fund = Float(gets.chomp)
                raise "Initial deposit must be greater than Zero!" if fund < 0
                Account.new(name, fund, aadhar)
            else
                puts "Addhar Number has only 12 digit Please enter Valid Aadhar!"
            end
        when 2
            puts "Enter Account Number"
            account_number = gets.chomp
            customer = Account.get_customer(account_number)
            if customer
                puts "Customer Info:"
                puts "Name: #{customer['name']}"
                puts "Name: #{account_number}"
                puts "Aadhar: #{customer['aadhar']}"
                puts "Balance: #{customer['balance']}"
            else
                puts "Customer Not found! Please enter valid account number"
            end
        when 3
            Transaction.transaction_process
        when 4
            customers = Account.get_customer_all
            customers.each do |acc_num, value|
                puts "-" * 35
                puts "Customer Info:"
                puts "Name: #{value['name']}"
                puts "Account Number: #{acc_num}"
                puts "Aadhar: #{value['aadhar']}"
                puts "Balance: #{value['balance']}"
            end
        when 5
            puts "Thank you for visiting Bank. Goodbye!"
            break
        else
            puts "Invalid option. Please choose a valid number (1, 2 or 3)."
        end
    rescue ArgumentError => e
        puts "Invalid input. Please enter a valid number."
    rescue RuntimeError => e 
        puts "Error: #{e}"
    end
end

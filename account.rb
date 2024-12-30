class Account
  attr_reader :account_number, :name, :balance, :aadhar

  @@total_accounts = 0
  @@customers = {}

  def initialize(name, initial_deposit = 0, aadhar)
    @name = name
    @balance = initial_deposit
    @aadhar = aadhar
    @@total_accounts += 1
    @account_number = generate_account_number
    @@customers[@account_number] = {'name' => @name, 'aadhar' => @aadhar, 'balance' => @balance}
    puts "Account created successfully for #{@name} with Account Number: #{@account_number}"
  end

  def self.get_customer(acc_num)
    @@customers[acc_num] if @@customers.key?(acc_num)
  end

  def self.get_customer_all
    @@customers
  end

  # Method to create dummy customers
  def self.create_dummy_accounts
    dummy_accounts = [
        { name: 'Cheems', fund: 500,  aadhar: 123423456789 },
        { name: 'Chinni', fund: 900,  aadhar: 984745671234 },
        { name: 'Bobi', fund: 500,  aadhar: 981298764567 },
        { name: 'Chintu', fund: 10500,  aadhar: 545623458734 },
        { name: 'Veer', fund: 50,  aadhar: 798498762345 },
        { name: 'Imli', fund: 5000000,  aadhar: 456523450987 }
    ]

    dummy_accounts.each do |customer|
        Account.new(customer[:name],customer[:fund].to_f,customer[:aadhar])
    end
  end

  private

  def generate_account_number
    "AC200403#{@@total_accounts}"
  end
end

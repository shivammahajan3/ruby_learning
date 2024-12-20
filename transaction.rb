require_relative 'account'
require_relative 'transaction_history'

$transaction_id = 0
$transaction_data = {}

class Transaction
  extend TransactionHistory

  def self.transaction_process
    loop do
      puts "--------------------------------------"
      puts "Select transaction option:"
      puts "1. Deposit"
      puts "2. Withdraw"
      puts "3. Check balance"
      puts "4. Transfer Amount"
      puts "5. Transaction History"
      puts "6. Exit"
      
      option = gets.to_i

      case option
      when 1
        puts "Enter Account Number:"
        acc_num = gets.chomp
        puts "Enter the amount to deposit:"
        amount = gets.to_f
        Transaction.deposit(acc_num, amount)
      when 2
        puts "Enter Account Number:"
        acc_num = gets.chomp
        puts "Enter the amount to withdraw:"
        amount = gets.to_f
        Transaction.withdraw(acc_num, amount)
      when 3
        puts "Enter Account Number:"
        acc_num = gets.chomp
        Transaction.display_balance(acc_num)
      when 4
        puts "Enter Account Number of Receiver"
        receiver_acc_num = gets.chomp
        puts "Enter Account Number of Sender"
        sender_acc_num = gets.chomp
        if Account.get_customer(receiver_acc_num)
          puts "Enter The Amount"
          amount = gets.to_f
          Transaction.transfer_amount(sender_acc_num, receiver_acc_num, amount)
        else
          puts "Customer Not found! Please enter a valid Account Number!"
        end
      when 5
        puts "Enter Account Number for Transaction History"
        acc_num = gets.chomp
        Transaction.get_transaction_history(acc_num)
      when 6
        puts "Exiting Transaction Menu..."
        break
      else
        puts "Invalid option. Please choose again."
      end
    end
  end

  def self.display_balance(acc_num)
    customer = Account.get_customer(acc_num)
    if customer
      puts "Account holder: #{customer['name']}"
      puts "Account number: #{acc_num}"
      puts "Current balance: ₹#{customer['balance']}"
    else
      puts "Account not found!"
    end
  end

  def self.deposit(acc_num, amount)
    customer = Account.get_customer(acc_num)
    if customer
      $transaction_id += 1
      if amount > 0
        customer['balance'] += amount
        puts "Deposited ₹#{amount} to account number #{acc_num}. New balance: ₹#{customer['balance']}"
        Transaction.record_transaction("Bank", acc_num, "Success", "Deposit successful",amount)
      else
        puts "Invalid deposit amount!"
        Transaction.record_transaction("Bank", acc_num, "Failure", "Invalid deposit amount",amount)
      end
    else
      puts "Account not found!"
    end
  end

  def self.withdraw(acc_num, amount)
    customer = Account.get_customer(acc_num)
    if customer
      $transaction_id += 1
      if amount > 0 && amount <= customer['balance']
        customer['balance'] -= amount
        puts "Withdrew ₹#{amount} from account number #{acc_num}. Remaining balance: ₹#{customer['balance']}"
        Transaction.record_transaction(acc_num, "Bank", "Success", "Withdrawal successful",amount)
      else
        puts "Invalid withdrawal amount or insufficient funds!"
        Transaction.record_transaction(acc_num, "Bank", "Failure", "Insufficient funds or invalid amount",amount)
      end
    else
      puts "Account not found!"
    end
  end

  def self.transfer_amount(sender_acc_num, receiver_acc_num, amount)
    sender = Account.get_customer(sender_acc_num)
    receiver = Account.get_customer(receiver_acc_num)
    if sender != receiver
      if sender && receiver
        $transaction_id += 1
        if amount > 0 && amount <= sender['balance']
          sender['balance'] -= amount
          receiver['balance'] += amount
          puts "Transferred ₹#{amount} from account number #{sender_acc_num} to account number #{receiver_acc_num}"
          Transaction.record_transaction(sender_acc_num, receiver_acc_num, "Success", "Amount transfer successfully",amount)
        else
          puts "Invalid transfer amount or insufficient funds!"
          Transaction.record_transaction(sender_acc_num, receiver_acc_num, "Failure", "Insufficient funds or invalid amount",amount)
        end
      else
        puts "Invalid sender or receiver account number!"
      end
    else
      puts "Sender and Reciver are Same"
    end
  end  
end

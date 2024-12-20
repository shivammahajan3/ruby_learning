module TransactionHistory
    
  def record_transaction(from_customer, to_customer, status, message, amount)
    $transaction_id += 1
    $transaction_data[$transaction_id] = {
      "from_customer" => from_customer,
      "to_customer" => to_customer,
      "status" => status,
      "message" => message,
      "amount" => amount,
      "time" => "#{(Time.now.hour % 12 == 0 ? 12 : Time.now.hour % 12)}:#{Time.now.min}:#{Time.now.sec} #{Time.now.hour >= 12 ? 'PM' : 'AM'} Date : #{Time.now.day}/#{Time.now.mon}/#{Time.now.year}"
    }
  end

  def set_transaction(from_customer, to_customer, status, message, amount)
    $transaction_id += 1
    $transaction_data[$transaction_id] = {
      "from_customer" => from_customer,
      "to_customer" => to_customer,
      "status" => status,
      "message" => message,
      "amount" => amount,
      "time" => "#{(Time.now.hour % 12 == 0 ? 12 : Time.now.hour % 12)}:#{Time.now.min}:#{Time.now.sec} #{Time.now.hour >= 12 ? 'PM' : 'AM'} Date: #{Time.now.day}/#{Time.now.mon}/#{Time.now.year}"
    }
  end

  def get_transaction_history(acc_num)
    selected_history = $transaction_data.values.select do |transaction|
        transaction["from_customer"] == acc_num || transaction["to_customer"] == acc_num    
    end

    if selected_history.empty?
        puts "No transaction history found for account number #{acc_num}"
    else
      selected_history.each do |history|
        from_customer = Account.get_customer(history["from_customer"])
        to_customer = Account.get_customer(history["to_customer"])

        if from_customer
            puts "Debited From : #{from_customer['name']} (#{history['from_customer']})"
        else
            puts "Debited From : Bank"
        end

        if to_customer
            puts "Credited to : #{to_customer['name']} (#{history['to_customer']})"
        else
            puts "Credited to : Bank"
        end
        puts "Status: #{history['status']}"
        puts "Message: #{history['message']}"
        puts "Amount: #{history['amount']}"
        puts "Transaction Time: #{history['time']}"
        puts "-" * 35
      end
    end
  end
end

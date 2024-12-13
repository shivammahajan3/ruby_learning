# stock buy and sell for profit

def stock_picker(stock_arr)
    len = stock_arr.length
    profit = 0
    result_arr = Array.new(2,0)
    (0...len).each do |i|
        buy = stock_arr[i]
        (i+1...len).each do |j|
            sell = stock_arr[j]
            result = sell - buy
            if result > profit
                profit = result
                result_arr[0] = i
                result_arr[1] = j
            end
        end
    end
    result_arr
end

puts "#{stock_picker([17,3,6,9,15,8,6,1,10])}"    #     [1,4]
puts "#{stock_picker([17,3,6,9,15,80,6,1,10])}"   #     [1,5]

# def stock_picker(stock_arr)
#     min_price = stock_arr[0]
#     max_profit = 0
#     result_arr = [0, 0]
  
#     stock_arr.each_with_index do |current_price, current_index|
#       if current_price < min_price
#         min_price = current_price
#         next
#       end
  
#       profit = current_price - min_price
  
#       if profit > max_profit
#         max_profit = profit
#         result_arr = [stock_arr.index(min_price), current_index]
#       end
#     end
    
#     result_arr
#   end

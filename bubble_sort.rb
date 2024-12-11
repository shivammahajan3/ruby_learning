# bubble sort

def bubble_sort(arr)
    len = arr.length
    (0...len).each do |i|
       (i+1...len).each do |j|
            if(arr[i] > arr[j])
                temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp       
            end
       end
    end
    arr
end

arr = [4,5,7,8,2,34,7,78,4]
puts "#{bubble_sort(arr)}"
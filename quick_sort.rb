# Quick Sort

class QuickSort
   
    def partition(arr,low,high)
        pivot = arr[low]
        count = 0
        (low+1...arr.length).each { |i| count += 1 if arr[i] <= pivot}

        # place pivot at right index
        pivot_index = count + low
        arr[pivot_index],arr[low] = arr[low], arr[pivot_index]

        i = low
        j = high

        while(i < pivot_index && j > pivot_index)
            i += 1 while arr[i] < pivot
            j -= 1 while arr[j] > pivot
            if(i < pivot_index && j > pivot_index)
                arr[i], arr[j] = arr[j], arr[i]
                i += 1
                j -= 1
            end
        end
        return pivot_index
    end

    def divide(arr,low,high)
        return if low >= high  # base Case
        pivot = partition(arr,low,high)   
        divide(arr,low,pivot-1)         # for left side part
        divide(arr,pivot+1,high)        # for right side part
    end

    def quick_sort
        puts "Enter The Number of Element: "
        len = gets.strip
    
        if len.empty? || len.to_i <= 0 
            puts "Please Enter a Valid Number :)"
            return
        end
        
        len = len.to_i
        arr = []
        puts "Enter the Elements:"
        i = 0
        while i < len
            input = gets
            begin
              arr[i] = Integer(input)   # Number Conversion
              i += 1
            rescue StandardError
              puts "Please enter a valid integer value"
            end
        end
            
        divide(arr, 0, len - 1)
        puts "Sorted array: #{arr}"        
    end
end

quickSort = QuickSort.new
quickSort.quick_sort
# Merge Sort

class MergeSort
    def merge(arr,start_index,mid,end_index)
        merged_arr = []
        i = start_index
        j = mid + 1
        
        while(i <= mid && j <= end_index)
            if(arr[i] <= arr[j])
                merged_arr.push(arr[i])
                i += 1
            else
                merged_arr.push(arr[j])
                j += 1
            end
        end

        while(i <= mid)
            merged_arr.push(arr[i])
            i += 1
        end

        while(j <= end_index)
            merged_arr.push(arr[j])
            j += 1
        end
        
        for i in 0...merged_arr.length
            arr[start_index + i] = merged_arr[i]
        end

        return arr
    end

    def split_array(arr,start_index,end_index)
        return if start_index >= end_index
        mid = start_index + (end_index - start_index) / 2
        split_array(arr,start_index,mid)
        split_array(arr,mid+1,end_index)
        merge(arr,start_index,mid,end_index)
    end

    def merge_sort
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
            
        split_array(arr, 0, len - 1)
        puts "Sorted array: #{arr}"        
    end
end

sort = MergeSort.new
sort.merge_sort()

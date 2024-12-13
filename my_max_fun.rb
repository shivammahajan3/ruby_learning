def fun_max(arr,max)
    return "Please Enter The Valid Number" if arr.empty? || max <= 0 || max > arr.length
    len = arr.length
    (0...len).each do |i|
       (i+1...len).each do |j|
            if(arr[i] < arr[j])
                temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            end
       end
    end
    arr[max-1]
end

arr = [2,3,4,53,7,8,9,12,35,65,2]
puts "#{fun_max(arr,2)}"

stock_picker = [17,3,6,9,15,8,6,1,10]

array = [1,17,16,15,14,13,12,11,10,2,100]


loop do
	sorted = false
		(array.count-1).times { |i| 
			if array[i] > array[i+1]
				array[i], array[i + 1] = array[i + 1], array[i]
				sorted = true
			end
			puts array.inspect

		}
	break unless sorted
end
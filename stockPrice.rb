stock_picker = [17,3,6,9,15,8,6,1,10]

stock_picker = [1,17,16,15,14,13,12,11,10,2,100]

sell_day = 0
buy_day = 0

stock_picker.each_with_index do |buy_price, buy_index|
	stock_picker[buy_index + 1..].each_with_index do |sell_price, sell_index|
		sell_index = buy_index + 1 + sell_index
		if sell_price - buy_price > stock_picker[sell_day] - stock_picker[buy_day]
			sell_day = sell_index
			buy_day = buy_index
		end
	end
end

puts "#{stock_picker[sell_day]} a #{stock_picker[buy_day]}"
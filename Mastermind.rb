def check_guess input_array, combination_array
	black = 0
	white = 0

	(0..3).each do |i|
		black += 1 if input_array[i] == combination_array[i]
	end

	(1..6).each do |i|
		white += [input_array.count(i), combination_array.count(i)].min
	end
	
	puts "Correct positions #{black} - blacks"
	puts "Correct numbers with wrong positions #{white - black} - whites"
end

combination = Array.new(4) { rand(1..6) }

i = 0

while i < 12
	i += 1

	begin
	  puts "Enter 4 numbers (1-6), separated by spaces:"
	  input = gets.chomp.split.map(&:to_i)
	end until input.size == 4 && input.all? { |n| (1..6).include?(n) }

	check_guess input, combination
end


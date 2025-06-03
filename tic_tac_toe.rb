class Game
	def initialize
		@array = Array.new(3) { Array.new(3, " ") }
		@player = 'X'
	end

	def start_game
		loop do
			if winner
				puts "Winner is player #{winner}"
				break
			end
			
			row, column = gets.chomp.delete(" ").split(",").map(&:to_i)
			
			unless validate_input? row, column
				puts "Incorrect input!"
				next
			end

			place_sign row, column

			print_array
		end
	end

	private

	def print_array
		@array.each { |row| puts row.join(" | ") }
	end

	def place_sign row, column
		@array[row][column] = @player 
		@player = @player == 'X' ?  'O' : 'X'
	end

	def validate_input? row, column
		return row.between?(0,2) && column.between?(0,2) && @array[row][column] == " " ? true : false
	end

	def winner
		rows = @array
		columns = @array.transpose
		diag1 = [[@array[0][0], @array[1][1], @array[2][2]]]
		diag2 = [[@array[0][2], @array[1][1], @array[2][0]]]
 
 		lines = rows + columns + diag1 + diag2

		return "X" if lines.any? { |line| line.all? { |cell| cell == "X" } } 
		return "O" if lines.any? { |line| line.all? { |cell| cell == "O" } } 
		return nil

	end
end

Game.new.start_game
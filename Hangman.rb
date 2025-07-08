class Hangman
	def initialize
		dictionary = File.readlines('google-10000-english-no-swears.txt').map(&:chomp)
		@secret_word = dictionary.select { |x| x.length.between?(5,12) }.sample.downcase
		@guessed_word = nil

		@correct_letters = []
		@incorrect_letters = []
		@i = 0
		@counter = 0
	end

	def play
		until @i == 7 || @guessed_word == @secret_word

			puts "Zadej pismeno .. nebo save pokud chces hru ulozit a nebo load pokud chces nacist predchozi hru"
			@guessed_letter = gets.chomp.downcase

			if @guessed_letter == "save"
				self.save
				next
			end

			if @guessed_letter == "load"
				self.load
				next
			end

			if @guessed_letter.length !=1 || !@guessed_letter.match(/[a-z]/)
				print "Zadej pouze jedno pismeno ve formatu a-z!"
				next
			end
			
			if @secret_word.include?(@guessed_letter)  
				@correct_letters << @guessed_letter unless @correct_letters.include?(@guessed_letter)
			else
				@incorrect_letters << @guessed_letter unless @incorrect_letters.include?(@guessed_letter)
				@i +=1 
			end

			@guessed_word = @secret_word.chars.map { |x| @correct_letters.include?(x) ? x : '_' }.join

			puts "Pokus c.#{@counter += 1}. Uhodl jsi zatim: #{@guessed_word} a mas stale #{7-@i} pokusu."
			puts "Zkousel jsi uz #{@incorrect_letters}"
		end

		if @guessed_word == @secret_word
		  puts "🎉 Výhra! Slovo bylo: #{@secret_word}"
		else
		  puts "💀 Prohra! Slovo bylo: #{@secret_word}"
		end
	end

	def save
		saved_data = { 
			secret_word: @secret_word,
			correct_letters: @correct_letters,
			incorrect_letters: @incorrect_letters,
			i: @i,
			counter: @counter
		}

		File.open("save.bin","wb") do |file|
			Marshal.dump(saved_data, file)
		end

		puts "Hra ulozena. Nazev souboru je save.bin"
	end

	def load
		saved_data = File.open("save.bin", "rb") { |file| Marshal.load(file)}
			
		@secret_word = saved_data[:secret_word]
		@correct_letters = saved_data[:correct_letters]
		@incorrect_letters = saved_data[:incorrect_letters]
		@i = saved_data[:i]
		@counter = saved_data[:counter]
		@guessed_word = @secret_word.chars.map { |x| @correct_letters.include?(x) ? x : '_' }.join

		puts "Hra nactena."
		puts "Pokus c.#{@counter}. Uhodl jsi zatim: #{@guessed_word} a mas stale #{7-@i} pokusu."
	end
end
 








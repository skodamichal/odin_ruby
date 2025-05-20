def ceasar_cipher(string, number)
 	string.chars.map do |char| 
		if char.match?(/[A-Za-z]/) 
			base = char.match?(/[A-Z]/)  ? 'A'.ord : 'a'.ord
			((char.ord - base + number) % 26 + base).chr
		else 
			char
		end
	end.join('')	
end

puts ceasar_cipher('abcdef 1 gh UJWZ azk', 30)
puts ceasar_cipher('abcdef 1 gh UJWZ azk', 4)
puts ceasar_cipher('abcdef 1 gh UJWZ azk', 60)


string = "Down go go go Go part shit!"
dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring (string, dict)
	array = string	
	.downcase
	.split(' ')
	.map { |word| word.gsub(/[^a-zA-Z]/, "") }
	.each_with_object(Hash.new(0)) { |word, output_hash| output_hash[word] += 1 if dict.include?(word) }
end

puts substring(string, dict)


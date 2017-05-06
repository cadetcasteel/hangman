class Hangman 
	attr_accessor :name,:guessed,:correct_blank,:counter

	def initialize(password_name)
		@name = password_name.upcase
		@guessed = []
		@counter = 7
		@correct_blank = blank
	end
	def make_move(letter)
		if correct_letter?(letter)
			correct_index(letter)
			else
			@counter -=1
		end
	end


	def charcount
		name.length
	end
	def blank
		Array.new(charcount,"_")
	end

	def correct_letter?(letter)
		guessed.include?(letter)
	end
	def update_guessed(letter)
		guessed.push(letter)
	end
	def verify_guessed(letter)
		guessed.include?(letter)
	end
	def correct_index(guessedletter)
		password=name.split("")
		
		password.each_with_index do |letter,index_position|
			if letter == guessedletter
				correct_blank[index_position] = guessedletter
			end
		end
	end
	def available_guess(choice)
		if guessed.count(choice) == 7
			true
		else
			false
		end
	end
	def loser
		counter == 7
	end
	def winner
		if correct_blank.include?("_")

			false
		else

			true

		end

	end
end
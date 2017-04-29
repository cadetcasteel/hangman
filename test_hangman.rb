require "minitest/autorun"
require_relative "hangman.rb"

class Testhangmanfuctions < Minitest::Test

	def test_class_retuns_upcase_word
		hangman = Hangman.new("AShlEY")
		assert_equal("ASHLEY",hangman.name)
	end
	def test_class_returns_name
		hangman = Hangman.new("ASHLEY")
		assert_equal(6,hangman.charcount)
end

	def test_class_returns_six_blanks
		hangman = Hangman.new("ashley")
		assert_equal(["_","_","_","_","_","_"],hangman.blank)
	end
	def test_class_user_guess_is_pushed_into_guessed_array
		hangman = Hangman.new("ashley")
		hangman.guessed = ["s","a","w","k"]
		letter = "h"
		assert_equal(["s","a","w","k","h"],hangman.update_guessed(letter))
	end
	def test_return_one_corect_index_positions
		hangman = Hangman.new("ASHLEY")
		letter="L"
		hangman.correct_index(letter)
		assert_equal(["_","_","_","L","_","_"],hangman.correct_blank)
	end
	def test_return_corect_index_positions
		hangman = Hangman.new("ASHELY")
		hangman.correct_blank = ["_","_","_","L","_","_"]
		letter="A"
		hangman.correct_index(letter)
		assert_equal(["A","_","_","L","_","_"],hangman.correct_blank)
	end
	def test_correct_blank_array_stays_the_same_after_invalid_guess
		hangman = Hangman.new("ASHLEY")
		letter = "F"
		hangman.correct_index(letter)
		assert_equal(["_","_","_","_","_","_"],hangman.correct_blank)
	end
	def test_correct_blank_one_array_stays_the_same_after_invalid_guess
		hangman = Hangman.new("ASHLEY")
		letter = "H"
		hangman.correct_index(letter)
		assert_equal(["_","_","H","_","_","_"],hangman.correct_blank)
	end
	def test_class_see_if_guess_has_been_guessed
		hangman = Hangman.new("AHSLEY")
		hangman.guessed = ["s","w","y"]
		letter = "o"
		assert_equal(true,hangman.available_guess(letter))
	end
	def test_valid_letter
		hangman = Hangman.new("ashley")
		letter = "a"
		assert_equal(true,hangman.)
	end
	def test_invalid_letter
	end
end
require 'sinatra'
require_relative "hangman.rb"
enable :sessions

get '/' do
	erb:index
end

post '/player_names' do 
	player1 = params[:player1]
	player2 = params[:player2]
	"player 1 is #{player1} and player 2 is #{player2}"
	
	 redirect '/password?player1='+ player1 + "&player2=" + player2
end

get'/password' do
	player1 = params[:player1]
	player2 = params[:player2]
	"player 1 is #{player1} and player 2 is #{player2}"
	 erb :password, locals:{p1_name: player1,p2_name:player2}
end

post '/secretword' do
	password = params[:word]
	session[:game]=Hangman.new(password)
	player1 = params[:player1]
	player2 = params[:player2]
	"player 1 is #{player1} and player 2 is #{player2} and password is #{password}"
	redirect '/guessing?player1=' +player1 + '&player2=' + player2
end

get '/guessing' do

	player1 = params[:player1]
	player2 = params[:player2]
	erb :guessing, locals:{p1_name: player1, p2_name: player2, blank: session[:game].correct_blank, already_guessed: session[:game].guessed, message: "pick a letter", counter: session[:game].counter, message2: ""}
end

post '/guess' do
	player1 = params[:player1]
	player2 = params[:player2]
	choice = params[:letter].upcase
	if session[:game].loser

  redirect '/loser?player1='+ player1 + '&player2='+ player2
 end
	if session[:game].available_guess(choice)
			true
		session[:game].update_guessed(choice)
		session[:game].correct_index(choice)
		redirect '/guessing?player1='+ player1 + '&player2='+ player2
	else
		erb :guessing, locals:{p1_name: player1, p2_name: player2, blank: session[:game].correct_blank, already_guessed: session[:game].guessed, array: session[:game].guessed, message: "",message2: "Guess again/Already guessed", counter: session[:game].counter}
end

	get '/loser'
		player1 = params[:player1]
		player2 = params[:player2]
		erb :loser, locals:{p1_name: player1, p2_name: player2, word: session[:game].name}

end

	get "/winner" do
	"You Won"
end

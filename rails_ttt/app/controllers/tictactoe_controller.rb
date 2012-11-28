require 'tictactoe/game'
require 'tictactoe/board'
require 'tictactoe/inputoutput'
require 'tictactoe/board3x3'
require 'tictactoe/ai'

class TictactoeController < ApplicationController
	def home
		session[:game] = Game.new
	end

	def move
		game = session[:game]
		if game.board.game_over? || game.board.cells[params["cell"].to_i] == 'O' || game.board.cells[params["cell"].to_i] == 'X'
			render :json => {:invalid => "Invalid Move"}
		else
			game.board.move(params["cell"].to_i, 'X')
			@move = game.ai.make_move(game.board)
			game.board.move(@move, 'O')
			check_game_state(game)
			session[:game] = game
		end
	end

	def check_game_state(game)
		if game.board.winner
			game_over(game)
		elsif game.board.tie?
			stalemate(game)
		else
			make_move(game)
		end
	end

	def game_over(game)
		render :json => { :game_over => "Player #{game.board.winner} Wins!", :player => params[:cell], :comp => @move }
	end

	def stalemate(game)
		render :json => { :stalemate => 'Tie Game.', :player => params[:cell], :comp => @move }
	end

	def make_move(game)
		render :json => { :player => params[:cell], :comp => @move }
	end
end
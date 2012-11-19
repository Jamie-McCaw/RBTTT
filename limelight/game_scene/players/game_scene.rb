module GameScene

	def start_game
		@game = Game.new
	end

	def make_move(space)
		return if !scene.find(space).text.empty? || @game.board.game_over?
		move(space)
		check_game_state
		computer_turn
	end

	def check_game_state
		if @game.board.winner
			game_over
		elsif @game.board.tie?
			stalemate
		else
			update_display
		end
	end

	def computer_turn
		move = @game.ai.make_move(@game.board)
		@game.board.move(move, 'O')
		scene.find(move).text = 'O'
		check_game_state
	end

	def update_display
		scene.find('display').text = "X's Turn"
	end

	def stalemate
		scene.find('display').text = "Tie Game!"
	end

	def move(space)
		@game.board.move(space.to_i, 'X')
		scene.find(space).text = 'X'
	end

	def game_over
		scene.find('display').text = "Player #{@game.board.winner} Wins!"
	end
end
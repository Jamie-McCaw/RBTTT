class Game

  attr_accessor :board, :ai

  def initialize(io = InputOutput.new)
    @io = io
    @type = 'O'
    @ai = AI.new('O')
    @board = Board.new
  end

  def print_welcome_message
    @io.outputs 'Welcome to Tic Tac Toe!'
  end

  def print_player_x_turn
    @io.outputs "It is X's turn"
  end

  def print_input_symbol
    @io.prints "-> "
  end

  def game_loop
    until @board.game_over?
      draw_board      
      @board.move(get_move, 'X')
      end_turn
    end
  end

  def get_move
    validate_user_input(@io.input)
  end

  def validate_user_input(user_input)
    if user_input =~ /[0-9]/ && @board.move_available?(user_input.to_i)
      return user_input.to_i.abs
    else
      invalid_move
    end
  end

  def invalid_move
    @io.outputs "Invalid Choice"
    get_move
  end

  def clear_screen
    system('clear')
  end

  def end_turn
    draw_board
    check_game_state
    computer_turn
    check_game_state
  end

  def check_game_state
    if @board.game_over?
      print_winning_message
    end
  end

  def print_winning_message
    @io.outputs(@board.winner + " Wins") if @board.winner
    @io.outputs "Tie Game"        
  end
  
  def draw_board
    clear_screen
    print_welcome_message
    print_board
    print_player_x_turn
    print_input_symbol
  end

  def print_board
    @io.outputs @board.board_design
  end

  def computer_turn
    @io.outputs "Thinking..."
    move = @ai.make_move(@board)
    @board.move(move, @type)
  end
end

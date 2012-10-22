class Game

  attr_accessor :cells, :io

  def initialize(io = InputOutput.new ,cells = [0,1,2,3,4,5,6,7,8])
    @io = io
    @cells = cells
  end

  def setup_game
    print_welcome_message
    draw_board
    print_player_x_turn
  end

  def print_welcome_message
    @io.outputs 'Welcome to Tic Tac Toe!'
  end

  def print_player_x_turn
    @io.outputs "It is X's turn"
    @io.outputs "-> "
  end

  def available_moves
    moves = 0
    @cells.each do |cell|
      if cell.is_a?(Numeric)
        moves += 1
      end
    end
    return moves
  end

  def game_loop
    setup_game
    until game_over? do
      move(@io.input)
      end_turn
    end
  end

  def clear_screen
    system('clear')
  end

  def end_turn
    clear_screen
    setup_game
    check_game_state

  end

  def check_game_state
    if game_over?
      print_winning_message
    end
  end

  def print_winning_message
    @io.outputs winner + " Wins"
  end

  def game_over?
    return true if winner
    return true if tie?
    false
  end

  def tie?
    return true if !winner && available_moves < 1
  end

  def winner
    return 'X' if player_wins?('X')
    return 'O' if player_wins?('O')
    return nil
  end

  def player_wins?(sym)
    response = false
    winning_moves.each do |move_set|
      if move_set.all? { |cell| cell == sym}
        response = true
        break
      else
        response = false
      end
    end
    return response
  end

  def move(cell)
    @cells[cell.to_i] = 'X'
  end

  def draw_board
    @io.outputs <<-BOARD
#{@cells[0]} | #{@cells[1]} | #{@cells[2]}
---+---+---
#{@cells[3]} | #{@cells[4]} | #{@cells[5]}
---+---+---
#{@cells[6]} | #{@cells[7]} | #{@cells[8]}
BOARD
  end

  def winning_moves
    [
    [ @cells[0], @cells[1], @cells[2] ],
    [ @cells[3], @cells[4], @cells[5] ],
    [ @cells[6], @cells[7], @cells[8] ],

    [ @cells[0], @cells[3], @cells[6] ],
    [ @cells[1], @cells[4], @cells[7] ],
    [ @cells[2], @cells[5], @cells[8] ],

    [ @cells[0], @cells[4], @cells[8] ],
    [ @cells[6], @cells[4], @cells[2] ]
    ]
  end
end

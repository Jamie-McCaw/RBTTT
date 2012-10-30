class Board
  THREEBYTHREE = 9
  attr_accessor :cells

  def initialize(cells = [0,1,2,3,4,5,6,7,8])
  	@cells = cells
  end

  def dup
  	Board.new(@cells.dup)
  end

  def available_moves
    @cells.inject(0) do |sum, cell|
      sum += (cell.is_a?(Numeric) ? 1 : 0 )
    end
  end

  def move_available?(cell)
    @cells[cell].is_a?(Numeric)
  end

  def move(cell, type)
    if move_available?(cell)
      @cells[cell] = type
    end
  end

  def game_over?
    return true if winner
    return true if available_moves < 1
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

  def player_wins?(type)
    moves = cells.count == THREEBYTHREE ? winning_moves_three_by_three : winning_moves_four_by_four
    moves.each do |move_set|
      if move_set.all? { |cell| cell == type}
        return true
      end
    end
    return false
  end

  def board_design
    if @cells.count == 9
      return board_design_three_by_three
    elsif @cells.count == 16
      return board_design_four_by_four
    end
  end

  def board_design_three_by_three
    board = <<-BOARD
 #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
---+---+---
 #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
---+---+---
 #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
BOARD
  end

  def board_design_four_by_four
    board = <<-BOARD
 #{@cells[0]} | #{@cells[1]} | #{@cells[2]} | #{@cells[3]}
---+---+---+---
 #{@cells[4]} | #{@cells[5]} | #{@cells[6]} | #{@cells[7]}
---+---+---+---
 #{@cells[8]} | #{@cells[9]} | #{@cells[10]}| #{@cells[11]}
---+---+---+---
 #{@cells[12]}| #{@cells[13]}| #{@cells[14]}| #{@cells[15]}
BOARD
  end

  def winning_moves_three_by_three
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

  def winning_moves_four_by_four
    [
    [ @cells[0], @cells[1], @cells[2], @cells[3] ],
    [ @cells[4], @cells[5], @cells[6], @cells[7] ],
    [ @cells[8], @cells[9], @cells[10], @cells[11] ],
    [ @cells[12], @cells[13], @cells[14], @cells[15] ],

    [ @cells[0], @cells[4], @cells[8], @cells[12] ],
    [ @cells[1], @cells[5], @cells[9], @cells[13] ],
    [ @cells[2], @cells[6], @cells[10], @cells[14] ],
    [ @cells[3], @cells[7], @cells[11], @cells[15] ],

    [ @cells[0], @cells[5], @cells[10], @cells[15] ],
    [ @cells[3], @cells[6], @cells[9], @cells[12] ],
    ]
  end
end

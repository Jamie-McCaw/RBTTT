require 'rubygems'
require 'pry'
class AI
    
    attr_accessor :type

    def initialize(type)
      @type = type
      @infinity = Float::INFINITY
      @best_move = nil
    end

    def make_move(board)
      if board.cells.count == 16 && board.available_moves == 15
        if board.cells[5] == 5
          @best_move = 5
        else 
          @best_move = 6
        end
      elsif board.cells.count == 16 && board.available_moves == 13
        if board.cells[6] == 6
          @best_move = 6
        else
          @best_move = 10
        end
      else
        negamax(board, @type, 1, -@infinity, @infinity)
      end
      return @best_move
    end

    def opponent(piece)
      piece == 'X' ? 'O' : 'X'
    end

    def winner(board, player)
      if board.winner == player
        return 1
      elsif board.winner == opponent(player)
        return -1
      else
        return 0
      end
    end

    def negamax(board, player, depth, alpha, beta)
      if board.game_over?
        return winner(board, player)
      else
        best_rank = -@infinity
        opponent = opponent(player)

        board.available_spaces.each do |move|
          current_board = board.dup
          current_board.move(move, player)
          rank = -negamax(current_board, opponent, depth - 1, -beta, -alpha)
          if rank > alpha
            alpha = rank
            @best_move = move if depth == 1
          end
          break if alpha >= beta
        end
        return alpha
      end 
    end
end

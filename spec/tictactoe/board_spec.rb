require 'spec_helper'

describe Board do

  let(:io)     { stub(InputOutput.class) }
  let(:game)   { Game.new(io) }
  let(:ai)     { AI.new('O')}

  context "3x3" do
    let(:cells)  { cells = [0,1,2,3,4,5,6,7,8] }
    let(:board)  { Board.new }

    describe "winning moves" do

      it "tells us there is a winner for vertical" do
        board.cells = ['X','X','X',3,4,5,6,7,8]
        board.player_wins?('X').should be_true
        game.check_game_state
      end

      it "tells us there is a winner for horizontal" do
        board.cells = ['O',1,2,'O',4,5,'O',7,8]
        board.player_wins?('O').should be_true
      end

      it "tells us there is a winner for diagonal" do
        board.cells = ['Q',1,2,3,'Q',5,6,7,'Q']
        board.player_wins?('Q').should be_true
      end
    end

    describe "move" do
      it "places a move at cell 1" do
        board.move(1, 'X').should == 'X'
      end

      it "places a move" do
        board.move(0, 'X')
        board.cells[0].should == 'X'
      end
    end

    describe "available moves" do
      it "show available moves" do
        moves = board.available_moves
        moves.should == 9
      end
    end

    describe "end of game" do
      it "shows the game is not over" do
        board.game_over?.should be_false
      end

      it "shows the game is over" do
        board.should_receive(:available_moves).and_return(0)
        board.game_over?.should be_true
      end

      it "shows a tie game" do
        board.should_receive(:available_moves).and_return(0)
        board.tie?.should be_true
      end

      it "shows X is the winner" do
        board.should_receive(:player_wins?).with('X').and_return(true)
        board.winner.should == 'X'
      end

      it "shows O is the winner" do
        board.should_receive(:player_wins?).with('O').and_return(true)
        board.should_receive(:player_wins?).with('X').and_return(false)
        board.winner.should == 'O'
      end
    end
  end

  context "4x4" do
    let(:board)  { Board.new([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]) }

    describe "available_moves" do

      it " shows available moves for 4x4" do
        moves = board.available_moves
        moves.should == 16
      end
    end

    describe "winning moves" do

      it "tells us there is a winner for horizontal" do
        board.cells = ['X','X','X','X',4,5,6,7,8,9,10,11,12,13,14,15]
        board.player_wins?('X').should be_true
        game.check_game_state
      end


      it "tells us there is not a winner horizontal" do
        board.cells = ['X','X','X','O',4,5,6,7,8,9,10,11,12,13,14,15]
        board.player_wins?('X').should be_false
        game.check_game_state
       end

      it "tells us there is a winner for vertical" do
        board.cells = ['O',1,2,3,'O',5,6,7,'O',9,10,11,'O',13,14,15]
        board.player_wins?('O').should be_true
      end

      it "tells us there is a winner for diagonal" do
        board.cells = ['Q',1,2,3,4,'Q',6,7,8,9,'Q',11,12,13,14,'Q']
        board.player_wins?('Q').should be_true
      end
    end
  end
end

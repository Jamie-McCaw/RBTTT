require 'spec_helper'

describe Game do

    let(:io)     { InputOutput.new }
    let(:game)   { Game.new(io) }
    let(:cells)  { cells = [0,1,2,3,4,5,6,7,8] }
    let(:board)  {
<<-BOARD
#{cells[0]} | #{cells[1]} | #{cells[2]}
---+---+---
#{cells[3]} | #{cells[4]} | #{cells[5]}
---+---+---
#{cells[6]} | #{cells[7]} | #{cells[8]}
BOARD
}

  describe "start" do

    it "sends a welcome message" do
      game.should_receive(:print_welcome_message)
      game.setup_game
    end

    it "shows the board" do
      game.should_receive(:draw_board)
      game.setup_game
     # io.should_receive(:puts).with(board)
     # io.outputs(board)
    end

    it "shows whos turn it is" do
      io.should_receive(:puts).with("It is X's turn")
      io.outputs("It is X's turn")
    end

    it "shows a prompt for input" do
      io.should_receive(:puts).with("-> ")
      io.outputs("-> ")
    end

    it "gets input from the player" do
      io.should_receive(:input).and_return('X')
      io.input.should == 'X'
    end

    it "places a move at cell 1" do
      game.move(1).should == 'X'
    end
  end

  describe "game" do

    it "show available moves" do
      moves = game.available_moves
      moves.should == 9
    end

    it "places a move" do
      game.move(0)
      game.cells[0].should == 'X'
    end

    it "runs through end_turn" do
      game.should_receive(:clear_screen)
      game.should_receive(:setup_game)
      game.should_receive(:check_game_state)
      game.end_turn
    end
  end

  describe "end" do

    it "tests whether the game is won" do
      game.check_game_state.should be_false
    end

    it "tests whether the game is won and shows who won" do
      game.move(0)
      game.move(1)
      game.move(2)
      game.should_receive(:print_winning_message)
      game.check_game_state
    end

    it "shows the game is not over" do
      game.game_over?.should be_false
    end

    it "shows the game is over" do
      game.should_receive(:available_moves).and_return(0)
      game.game_over?.should be_true
    end

    it "shows a tie game" do
      game.should_receive(:available_moves).and_return(0)
      game.tie?.should be_true
    end

    it "shows X is the winner" do
      game.should_receive(:player_wins?).with('X').and_return(true)
      game.winner.should == 'X'
    end

    it "shows O is the winner" do
      game.should_receive(:player_wins?).with('O').and_return(true)
      game.should_receive(:player_wins?).with('X').and_return(false)
      game.winner.should == 'O'
    end
  end

  describe "winning moves" do

    it "tells us there is a winner for vertical" do
      game.cells = ['X','X','X',3,4,5,6,7,8]
      game.player_wins?('X').should be_true
    end

    it "tells us there is a winner for horizontal" do
      game.cells = ['O',1,2,'O',4,5,'O',7,8]
      game.player_wins?('O').should be_true
    end

    it "tells us there is a winner for diagonal" do
      game.cells = ['Q',1,2,3,'Q',5,6,7,'Q']
      game.player_wins?('Q').should be_true
    end
  end
end

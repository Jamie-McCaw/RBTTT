require 'spec_helper'

	describe AI do

	let(:ai)	{ AI.new('O') }

    context "3x3" do

	  let(:board) { Board3x3.new }

      describe "ai" do

        it "makes the computer win" do
          board.move(0,'O')
          board.move(4,'X')
          board.move(3,'X')
          board.move(6,'X')
          board.move(1,'O')
          ai.make_move(board).should == 2
        end

        it "makes the computer block" do
          board.move(3, 'X')
          board.move(0, 'O')
          board.move(5, 'X')
          ai.make_move(board).should == 4
        end
      end

      describe "player wins" do
        it "shows positive for player winning" do
          board.stub(:winner) { 'X' }
          ai.winner(board, 'X').should == 1
        end
        it "shows negative for opponent winning" do
          board.stub(:winner) { 'X' }
          ai.winner(board, 'O').should == -1
        end
      end
    end

    context "4x4" do

    let(:board) { Board4x4.new }

      describe "ai" do
        it "makes the computer win" do
          board.move(0,'O')
          board.move(1,'O')
          board.move(2,'O')
          board.move(4,'X')
          board.move(5,'X')
          board.move(14,'X')
          board.move(15,'X')
          ai.make_move(board).should == 3
        end

        it "makes the computer block" do
          board.move(0,'O')
          board.move(1,'O')
          board.move(9,'O')
          board.move(4,'X')
          board.move(5,'X')
          board.move(6,'X')
          board.move(15,'X')
          ai.make_move(board).should == 7
        end
      end
    end
	end

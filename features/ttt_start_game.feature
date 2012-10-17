Feature: player starts game

  As a player
  I want to start a game
  So that I can play Tic Tac Toe

  Scenario: start game
    Given I am not yet playing
    When I start a new game
    Then I should see "Welcome to Tic Tac Toe!"
    And I should see the board
    And I should see "It is X's turn"
    And I should see "-> "

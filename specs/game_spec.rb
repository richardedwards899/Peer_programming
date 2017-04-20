require ('minitest/autorun')
require ('minitest/emoji')

require_relative ('../game.rb')
require_relative ('../player.rb')
require_relative ('../board.rb')

class TestGame < MiniTest::Test

  def setup
    @player1=Player.new("Richard")
    @player2=Player.new("Matthew")
    @player3=Player.new("Craig")
    @players=[@player1, @player2, @player3]
    @board=Board.new(4,4)

    @game=Game.new(@players, @board)
  end

  def test_check_can_create_game
    assert_equal(Game,@game.class())
  end

  def test_get_board
    assert_equal(16,@game.get_board().total_board_size)
  end

  def test_has_players
    assert_equal(3, @game.get_players().count())
  end

  def test_we_have_a_winner_false
    assert_equal(false,@game.we_have_a_winner)
  end

  def test_winner
    assert_nil(nil,@game.winner())
  end

  def test_move_player_on_board__no_ladder
    @game.move_player_on_board(@player1, 3)
    assert_equal(3, @player1.get_position())
  end

  def test_move_player_on_board__up_ladder
    @game.move_player_on_board(@player1, 4)
    assert_equal(10, @player1.get_position())
  end

  def test_move_player_on_board__down_snake
    @game.move_player_on_board(@player1, 5)
    assert_equal(1, @player1.get_position())
  end

  def test_move_player_on_board__up_ladder_down_snake
    @game.move_player_on_board(@player1, 4)
    assert_equal(10, @player1.get_position())

    @game.move_player_on_board(@player1, 4)
    assert_equal(7, @player1.get_position())
  end

  #tests whether we are prevented from running off the board
  def test_stop_on_final_square
    @player1.set_position(12)
    @game.move_player_on_board(@player1, 100)
    assert_equal(15, @player1.get_position())

    @player2.set_position(14)
    @game.move_player_on_board(@player2, 1)
    assert_equal(15, @player1.get_position())
  end

  def test_can_declare_winner
    @player1.set_position(12)
    @game.move_player_on_board(@player1, 3)
    assert_equal(15, @player1.get_position())

    assert_equal(true, @game.we_have_a_winner)
    assert_equal(@player1, @game.winner)
  end

  def test_can_all_players_have_a_shot
    
    @game.play_round()
  
    assert_equal(true, @player1.get_position > 0)
    assert_equal(true, @player2.get_position > 0)
    assert_equal(true, @player3.get_position > 0)
  end

  def test_can_play_game_and_set_winner_flag
    puts
    puts "---------Game output-----------------"
    puts
    @game.play_game()

    assert_equal(true, @game.we_have_a_winner)
  end

end
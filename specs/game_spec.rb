require ('minitest/autorun')
require ('minitest/emoji')

require_relative ('../game.rb')
require_relative ('../player.rb')
require_relative ('../board.rb')

class TestGame < MiniTest::Test

  def setup
    @player1=Player.new("Richard")
    player2=Player.new("Matthew")
    player3=Player.new("Craig")
    @players=[player1,player2,player3]
    board=Board.new(4,4)

    @game=Game.new(@players,board)
  end

  def test_check_can_create_game
    assert_equal(Game,@game.class())
  end

  def test_get_board
    assert_equal(16,@game.get_board().total_board_size)
  end

  def test_has_players
    assert_equal(3, @game.get_players().count())
    player4=Player.new("Irma")
    player5=Player.new("Mari")
    @players.push(player4)
    @players.push(player5)
    assert_equal(5, @game.get_players().count())
  end

  def test_we_have_a_winner_false
    assert_equal(false,@game.we_have_a_winner)
  end

  def test_winner
    assert_equal(nil,@game.winner())
  end

  def test_move_up_ladder
    @player1.move_spaces(4)
    assert_equal(10,@player1.get_position)
  end

end
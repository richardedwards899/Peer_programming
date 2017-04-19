require ('minitest/autorun')
require ('minitest/emoji')

require_relative ('../player.rb')

class TestPlayer < MiniTest::Test

  def setup
    @player = Player.new("Marilena")
  end

  def test_can_create_player
    assert_equal(Player, @player.class())
  end

  def test_check_initial_state
    assert_equal("Marilena", @player.name())
    assert_equal(0, @player.get_position())
  end

  def test_set_position
    assert_equal(6, @player.set_position(6))
    assert_equal(3, @player.set_position(3))
  end

  def test_get_position_after_set_position
    @player.set_position(6)
    assert_equal(6, @player.get_position())
  end

  def test_roll_die
    die_result = @player.roll_die()
    assert_equal(Integer, die_result.class())
    assert_equal(5, die_result)
  end

  def test_can_move_spaces_starting_from_0
    @player.move_spaces(6)
    assert_equal(6, @player.get_position())
  end

  def test_can_move_spaces_starting_from_10
    @player.set_position(10)
    @player.move_spaces(3)

    assert_equal(13, @player.get_position())
  end

end
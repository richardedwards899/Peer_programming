require ('minitest/autorun')
require('minitest/emoji')

require_relative('../board.rb')

class TestBoard < MiniTest::Test

  def setup
    height=4
    width=4
    @board=Board.new(height,width)

  end

  def test_can_create_board
    assert_equal(Board,@board.class())
  end

  def test_total_board_size
    assert_equal(16,@board.total_board_size)
  end

  def test_board_array_exists
    board_array=[nil,nil,nil,nil,10,1,nil,nil,nil,13,nil,nil,nil,nil,7,nil]
    assert_equal(board_array,@board.board_array)
  end

  def test_winning_position
    assert_equal(15,@board.winning_position)
  end

  def test_square_goes_to
    assert_nil(nil,@board.square_goes_to(0))
    assert_nil(nil,@board.square_goes_to(2))
    assert_equal(10,@board.square_goes_to(4))
    assert_equal(7,@board.square_goes_to(14))
  end

end
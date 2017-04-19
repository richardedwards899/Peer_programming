class Board

attr_reader :total_board_size, :board_array, :winning_position

  def initialize (height, width)
    @height = height
    @width = width
    @total_board_size = height*width
    @board_array = [nil,nil,nil,nil,10,1,nil,nil,nil,13,nil,nil,nil,nil,7,nil]
    @winning_position = @total_board_size -1
  end

  def square_goes_to(board_index)
      return @board_array[board_index]
  end

end
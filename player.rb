class Player

  attr_reader :name

  def initialize(name)
    @name = name
    @position = 0
  end

  def get_position
    return @position
  end

  #moves the player to the top of a ladder or the bottom of a snake
  def set_position(new_position)
    @position = new_position
  end

  def roll_die
    return [1,2,3,4,5,6].shuffle.pop
    # return 3
  end

  #moves the player according to the die
  def move_spaces(spaces_to_move)
    @position += spaces_to_move
  end

end

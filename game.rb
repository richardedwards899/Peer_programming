class Game

  def initialize (players, board)
    @board = board
    @players = players
    @we_have_a_winner = false
    @winner = nil
  end

  def get_board
    return @board
  end

  def get_players
    return @players
  end

  def we_have_a_winner
    return @we_have_a_winner
  end

  def winner
    return @winner
  end

  def move_player_on_board(player, squares_to_move)
    #move the player
    if (player.get_position + squares_to_move) <= @board.winning_position  
        player.move_spaces(squares_to_move)
        puts "#{player.name} moved to #{player.get_position}"
    else
        player.set_position(@board.winning_position)
    end
    square_landed_on = player.get_position()
    #determine if new square is a snake or ladder
    move_to = @board.square_goes_to(square_landed_on)
    if move_to != nil
      puts "WARPS!"
      player.set_position(move_to) 
    end
    puts "#{player.name} has pos: #{player.get_position}"
    #test if player has won!
    if player.get_position == @board.winning_position
      @we_have_a_winner = true
      @winner = player
      puts "#{player.name} has WON!!!"
    end 
  end

  def play_round
    for player in @players
      die_throw = player.roll_die
      puts "#{player.name} throws: #{die_throw}"
      self.move_player_on_board(player, die_throw)
    end
    puts
  end

  def play_game
    while !@we_have_a_winner
      self.play_round
    end
  end

end
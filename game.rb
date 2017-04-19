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

def move_up_ladder
  
end


end
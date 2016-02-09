class King < Piece

  def valid_move?(destination_row, destination_col)
    if "is move one of those valid moves (kings_move)"
      if obstructed?(destination_row,destination_col)
        "not valid move"
      else
        "valid move"
      end
    else
      "not valid move"
    end
  end

private

  # UP = [1,0]
  # DOWN = [-1,0]
  # LEFT = [0,-1]
  # RIGHT = [0,1]
  # UP_LEFT = [1,-1]
  # UP_RIGHT = [1,1]
  # DONW_LEFT = [-1,-1]
  # DOWN_RIGHT = [-1, 1]

  #which direction is valid for king
  kings_direction = [
    [1,0],
    [-1,0],
    [0,-1],
    [0,1],
    [1,-1],
    [1,1],
    [-1,-1],
    [-1, 1]
  ]

  #how many step can it make in each move
  kings_step = 1



end

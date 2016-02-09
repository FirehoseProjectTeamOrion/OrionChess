class King < Piece

  def valid_move?(destination_row, destination_col)
    if destination_direction(destination_row, destination_col) > kings_step
      return false
      if kings_direction.include(direction)
        return true
      else
        return false
      end
    else
      return false
    end
  end

private

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

  def destination_direction(destination_row, destination_col)
    direction = []
    direction_row = (destination_row - row)
    direction_column = (destination_column - column)
    direction = [direction_row,direction_column]
  end


end

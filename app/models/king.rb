class King < Piece

  def valid_move?(destination_row, destination_col)
    if kings_direction.include?(direction)
      return true
    else
      return false
    end
  end


  private

  # which direction is valid for king
  kings_direction = [
    [1, 0],
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 1],
    [-1, -1],
    [-1, 1]
  ]

end

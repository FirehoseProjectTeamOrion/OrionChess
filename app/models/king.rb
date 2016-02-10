class King < Piece
  def valid_move?(_destination_row, _destination_col)
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
    return true if kings_direction.include?(direction)
    false
  end
end

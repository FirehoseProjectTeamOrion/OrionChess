class Knight < Piece
  def valid_move?(destination_row, destination_column)
    direction = [destination_row - row, destination_column - column]
    knights_direction = [
      [2, 1], # up-right
      [1, 2], # right-up
      [-1, 2], # right-down
      [-2, 1], # down-right
      [-2, -1], # down-left
      [-1, -2], # left-down
      [1, -2], # left-up
      [2, -1] # up-left
    ]
    return true if knights_direction.include?(direction)
    false
  end

  def chess_font_character
    if white?
      'n'
    else
      'm'
    end
  end
end

class King < Piece
  def valid_move?(destination_row, destination_col)
    direction = [destination_row - row, destination_col - column]
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

  def chess_font_character
    if white?
      'k'
    else
      'l'
    end
  end
end

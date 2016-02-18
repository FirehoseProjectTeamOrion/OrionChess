class Queen < Piece

  def valid_move?(destination_row, destination_col)
    direction = [destination_row - row, destination_col - column]
    queens_direction = [
      [1, 0],
      [-1, 0],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 1],
      [-1, -1],
      [-1, 1]
    ]
    if obstructed?(destination_row, destination_column) && game.pieces.color == "white"

    end
  end

  def chess_font_character
    if white?
      'q'
    else
      'w'
    end
  end
end

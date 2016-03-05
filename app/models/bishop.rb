class Bishop < Piece
  def valid_move?(destination_row, destination_column)
    if moving_diagonally?(destination_row, destination_column)
      return true if (capturable?(destination_row, destination_column) || unoccupied_space?(destination_row, destination_column)) && unobstructed?(destination_row, destination_column)
    end
    false
  end

  def chess_font_character
    if white?
      'b'
    else
      'v'
    end
  end
end

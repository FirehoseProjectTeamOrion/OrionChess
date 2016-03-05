class Rook < Piece
  def valid_move?(destination_row, destination_column)
    if moving_vertically?(destination_column) || moving_horizontally?(destination_row)
      return true if (capturable?(destination_row, destination_column) || unoccupied_space?(destination_row, destination_column)) && unobstructed?(destination_row, destination_column)
    end
    false
  end

  def chess_font_character
    if white?
      'r'
    else
      't'
    end
  end
end
